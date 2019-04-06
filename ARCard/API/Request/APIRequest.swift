//
//  APIRequest.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/24.
//  Copyright © 2019 tomoki. All rights reserved.
//

import Alamofire

// MARK: - Heaaders -

enum Headers {
    case normal
    case none
    
    var item: [String: String] {
        switch self {
        case .normal:
            return [:]
        case .none:
            return [:]
        }
    }
}

// MARK: - APIRequest -

protocol APIRequest {
    var httpMethod: HTTPMethod { get }
    var headers: Headers { get }
    var path: String { get }
}

extension APIRequest {
    
    var headers: [String: String] {
        return self.headers.item
    }
    
    var baseURL: URL {
        return URL(string: "http://localhost:3000")!
    }
    
    var version: URL {
        return URL(string: "/v1")!
    }
    
    var urlComponents: URLComponents {
        guard let urlComponents = URLComponents(string: "\(self.baseURL)\(self.version)\(self.path)") else {
            assertionFailure("\(self.baseURL)\(self.version)\(self.path)は無効なURLです。")
            return URLComponents()
        }
        print("\(self.baseURL)\(self.version)\(self.path)に\(self.httpMethod)のリクエストを送りました")
        return urlComponents
    }
}

// MARK: - ParametersProvider -

protocol ParametersProvider {
    var parameters: [String: Any] { get }
}

// MARK: - DecodingRequest -

protocol DecodingRequest: APIRequest {
    associatedtype Decoded: Decodable
}

