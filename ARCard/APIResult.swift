//
//  APIResult.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/24.
//  Copyright © 2019 tomoki. All rights reserved.
//

import Foundation

enum APIResult {
    case success
    case failure(ErrorModel)
}

enum APIDecodingResult<Decoded: Decodable> {
    case success(Decoded)
    case failure(ErrorModel)
    
    func concealingDecodedValue(afterHandlingBy decodedValueHandler: (Decoded) -> Void) -> APIResult {
        switch self {
        case .success(let decoded):
            decodedValueHandler(decoded)
            return .success
        case .failure(let errorModel):
            return .failure(errorModel)
        }
    }
}

