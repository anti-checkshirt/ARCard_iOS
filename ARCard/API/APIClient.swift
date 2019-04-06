//
//  APIClient.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/24.
//  Copyright © 2019 tomoki. All rights reserved.
//

import Alamofire

struct APIClient {
    
    private init() {}
    
    /// NotDecodable
    static func send<Request: APIRequest>(_ request: Request,
                                          preprocessOnSuccess: @escaping () -> Void = {},
                                          completion: @escaping (APIResult) -> Void) {
        request.alamofireRequest
            .responseString { response in
                let statusCode = response.response?.statusCode
                let result: APIResult
                defer { completion(result) }
                
                switch response.result {
                case .success:
                    preprocessOnSuccess()
                    result = .success
                case .failure(let error):
                    result = .failure(ErrorModel(message: error.localizedDescription))
                }
        }
    }
    
    /// Decodable
    static func send<Request: DecodingRequest>(_ request: Request,
                                               decodingCompletion: @escaping (APIDecodingResult<Request.Decoded>) -> Void) {
        request.alamofireRequest
            .responseJSON { response in
                let result: APIDecodingResult<Request.Decoded>
                defer { decodingCompletion(result) }
                switch response.result {
                case .success:
                    guard let data = response.data else {
                        assertionFailure("response.resultがsuccessながresponse.dataがnilではないはず")
                        result = .failure(ErrorModel(message: "response.resultがsuccessならresponse.dataがnilでないはず"))
                        return
                    }
                    do {
                        let decoder = JSONDecoder()
                        let decoded = try decoder.decode(Request.Decoded.self, from: data)
                        result = .success(decoded)
                    } catch {
                        print("ERROR:", "\(type(of: Request.Decoded.self))型へのデコードに失敗しました")
                        debugPrint(error)
                        do {
                            let decoder = JSONDecoder()
                            let decoded = try decoder.decode(ErrorModel.self, from: data)
                            result = .failure(decoded)
                        } catch {
                            result = .failure(ErrorModel(message: "\(type(of: ErrorModel.self))型へのデコードに失敗しました"))
                        }
                    }
                case .failure:
                    result = .failure(ErrorModel(message: "\(type(of: Request.Decoded.self))型へ変換するJSONを取得できませんでした"))
                }
        }
    }
}

private extension APIRequest {
    
    var alamofireRequest: DataRequest {
        return Alamofire.request(self.urlComponents,
                                 method: self.httpMethod,
                                 parameters: (self as? ParametersProvider)?.parameters,
                                 encoding: JSONEncoding.default,
                                 headers: self.headers)
            .validate(statusCode: 200..<300)
    }
}

