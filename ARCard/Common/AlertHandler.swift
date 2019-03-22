//
//  AlertHandler.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/22.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

struct AlertHandler {
    private init() {}
    
    static func alertControllerForLogout() -> UIAlertController {
        let alert = UIAlertController(title: "ログアウト", message: "本当にログアウトしましか？", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "ログアウトする", style: .destructive) { _ in
            print("OK")
        }
        let cancelAction = UIAlertAction(title: "キャンセル", style: .cancel, handler: nil)
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        return alert
    }
}
