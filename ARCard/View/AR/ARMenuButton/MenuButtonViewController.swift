//
//  MenuButtonViewController.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/04/07.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class MenuButtonViewController: UIViewController {
    
    private var parentScreen: ARViewController {
        return self.parent as! ARViewController
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction private func menuButtonDidTappend(_ sender: UIButton) {
        parentScreen.openSubject.onNext(())
    }
}
