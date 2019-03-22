//
//  URL+ARCard.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/22.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

extension URL {
    /// 利用規約
    static var service: URL {
        return URL(string: "https://anti-checkshirt.github.io/ARCard_iOS/service")!
    }
    
    /// プライバシーポリシー
    static var privacy: URL {
        return URL(string: "https://anti-checkshirt.github.io/ARCard_iOS/privacy")!
    }
}
