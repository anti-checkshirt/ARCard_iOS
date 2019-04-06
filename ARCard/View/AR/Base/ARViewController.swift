//
//  ARViewController.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/22.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import ARKit
import SceneKit

class ARViewController: UIViewController {
    
    private var menuButton: MenuButtonViewController {
        return Storyboard.menuButton.instantiateViewController()
    }
    
    @IBOutlet private weak var sceneView: ARSCNView! {
        didSet {
            sceneView.showsStatistics = true
            sceneView.scene = SCNScene()
            sceneView.autoenablesDefaultLighting = true
        }
    }
    @IBOutlet private weak var menuButtonView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        if status == .denied {
            
        }
    }
    
    private func setUp() {
        displayContentController(content: menuButton, container: menuButtonView)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
