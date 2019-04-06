//
//  AuthAPI.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/24.
//  Copyright © 2019 tomoki. All rights reserved.
//

import FirebaseAuth

enum FirebaseResult<T> {
    case success(T)
    case error(ErrorModel)
}

struct AuthAPI {
    private init() {}
    
    /// ユーザーを作成する
    static func auth(email: String, password: String, completion: @escaping (APIResult) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { (_, error) in
            if let error = error {
                completion(.failure(ErrorModel(message: error.localizedDescription)))
            }
            completion(.success)
        }
    }
    
    /// idトークンを取得する
    static func getIDToken(completion: @escaping (FirebaseResult<String>) -> Void) {
        let currentUser = Auth.auth().currentUser
        currentUser?.getIDToken(completion: { (idToken, error) in
            if let error = error {
                completion(.error(ErrorModel(message: error.localizedDescription)))
            }
            completion(.success(idToken ?? ""))
        })
    }
}
