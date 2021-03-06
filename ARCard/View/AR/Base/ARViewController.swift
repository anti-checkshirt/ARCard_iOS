//
//  ARViewController.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/22.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import ARKit
import SnapKit
import RxSwift
import RxCocoa
import SceneKit
import NSObject_Rx

class ARViewController: UIViewController {
    
    let openSubject = PublishSubject<Void>()
    
    @IBOutlet private weak var sceneView: ARSCNView! {
        didSet {
            sceneView.showsStatistics = true
            sceneView.scene = SCNScene()
            sceneView.autoenablesDefaultLighting = true
        }
    }
    @IBOutlet private weak var menuButtonView: UIView!
    @IBOutlet private weak var menuView: UIView!
    @IBOutlet private weak var sceneViewRight: NSLayoutConstraint!
    private let overlayView: UIButton = {
        let view = UIButton()
        view.isUserInteractionEnabled = false
        view.backgroundColor = .black
        view.layer.opacity = 0.0
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUp()
        
        let status = AVCaptureDevice.authorizationStatus(for: .video)
        if status == .denied {
            
        }
        
        openSubject.subscribe(onNext: { [weak self] in
            guard let width = self?.view.frame.width else { return }
            UIView.animate(withDuration: 0.3, animations: {
                self?.overlayView.layer.opacity = 0.5
                self?.overlayView.isUserInteractionEnabled = true
                self?.sceneViewRight.constant = -width * 0.6
                self?.view.layoutIfNeeded()
            })
        }).disposed(by: rx.disposeBag)
        
        overlayView.rx.tap.asDriver().drive(onNext: { [weak self] in
            UIView.animate(withDuration: 0.3, animations: {
                self?.overlayView.layer.opacity = 0.0
                self?.overlayView.isUserInteractionEnabled = false
                self?.sceneViewRight.constant = 0
                self?.view.layoutIfNeeded()
            })
        }).disposed(by: rx.disposeBag)
    }
    
    private func setUp() {
        displayContentController(content: Storyboard.menuButton.instantiateViewController(), container: menuButtonView)
        displayContentController(content: Storyboard.menu.instantiateViewController(), container: menuView)
        
        sceneView.addSubview(overlayView)
        overlayView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalToSuperview()
        }
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
