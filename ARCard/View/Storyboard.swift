//
//  Storyboard.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/22.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

// MARK: - Storyboards -

class Storyboards {
    
    fileprivate init() {}
    
    static let debug = Storyboard<UINavigationController>(name: "Debug")
    static let ar = Storyboard<ARViewController>(name: "AR")
    static let menu = Storyboard<MenuViewController>(name: "Menu")
    static let menuButton = Storyboard<MenuButtonViewController>(name: "MenuButton")
    static let profile = Storyboard<ProfileViewController>(name: "Profile")
}

// MARK: - Storyboard -

final class Storyboard<InitialVC: UIViewController>: Storyboards {
    
    let name: String
    
    // MARK: - Initializer
    
    fileprivate init(name: String) {
        self.name = name
    }
    
    // MARK: - Methods
    
    func instantiateViewController() -> InitialVC {
        let storyboard = UIStoryboard(name: self.name, bundle: nil)
        guard let vc = storyboard.instantiateInitialViewController() else {
            assertionFailure("\(self.name).storyboardでinitialVCが設定されていません")
            return InitialVC()
        }
        guard let initialVC = vc as? InitialVC else {
            assertionFailure("\(self.name).storyboardのinitialVCは\(type(of: vc.self))型です")
            return InitialVC()
        }
        return initialVC
    }
}
