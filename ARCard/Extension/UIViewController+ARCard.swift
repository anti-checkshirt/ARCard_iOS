//
//  UIViewController+ARCard.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/22.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

extension UIViewController {
    override open func motionBegan(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if event?.type != UIEvent.EventType.motion && event?.subtype == UIEvent.EventSubtype.motionShake { return }
        let target = Storyboard.debug.instantiateViewController()
        self.present(target, animated: true)
    }
    
    func displayContentController(content: UIViewController, container: UIView) {
        addChild(content)
        content.view.frame = container.bounds
        container.addSubview(content.view)
        content.didMove(toParent: self)
    }
}
