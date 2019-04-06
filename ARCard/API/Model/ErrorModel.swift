//
//  ErrorModel.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/24.
//  Copyright © 2019 tomoki. All rights reserved.
//

import Foundation

enum ErrorType {
    case notFound
    case none
}

struct ErrorModel: Codable {
    
    private let errorType: String
    
    /// エラーメッセージ
    let message: String
    
    enum CodingKeys: String, CodingKey {
        case errorType = "type"
        case message
    }
    
    init(message: String) {
        self.message = message
        self.errorType = "none"
    }
    
    /// エラータイプ
    var type: ErrorType {
        switch errorType {
        case "not_found":
            return .notFound
        default:
            return .none
        }
    }
}

