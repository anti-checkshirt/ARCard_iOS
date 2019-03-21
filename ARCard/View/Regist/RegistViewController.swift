//
//  RegistViewController.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/21.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RegistViewController: UIViewController {
    
    private let disposeBag = DisposeBag()

    @IBOutlet private weak var baseScrollView: UIScrollView!
    @IBOutlet private weak var validationLabel: UILabel!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var organizerTextField: UITextField!
    @IBOutlet private weak var sexTextField: UITextField!
    @IBOutlet private weak var ageTextField: UITextField!
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var registButton: UIButton!
    @IBOutlet private weak var registButtonBottom: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureObserver()
        
        registButton.rx.tap.subscribe(onNext: { [weak self] in
            self?.registNext()
        }).disposed(by: disposeBag)
    }
    
    private func registNext() {
        
    }
}

// MARK: Notification

extension RegistViewController {
    private func configureObserver() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardHeight = notification.keyboardFrameEnd?.height else { return }
        print(keyboardHeight)
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
    }
}
