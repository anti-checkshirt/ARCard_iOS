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
    private lazy var viewModel = RegistViewModel(
        name: nameTextField.rx.text.asObservable(),
        organizer: organizerTextField.rx.text.asObservable(),
        model: RegistModel())
    
    @IBOutlet private weak var baseScrollView: UIScrollView!
    @IBOutlet private weak var validationLabel: UILabel!
    @IBOutlet private weak var backButton1: UIButton!
    @IBOutlet private weak var backButton2: UIButton!
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
        
        backButton1.rx.tap.subscribe(onNext: { [weak self] in
            self?.moveScroll(to: .left, completion: {
                self?.nameTextField.becomeFirstResponder()
            })
        }).disposed(by: disposeBag)
        
        backButton2.rx.tap.subscribe(onNext: { [weak self] in
            self?.moveScroll(to: .left, completion: {
                self?.sexTextField.becomeFirstResponder()
            })
        }).disposed(by: disposeBag)
        
        viewModel.firstbValidationText
        .bind(to: validationLabel.rx.text)
        .disposed(by: disposeBag)
        
        viewModel.firstLoadColor
        .bind(to: validationLabelColor)
        .disposed(by: disposeBag)
    }
    
    private var validationLabelColor: Binder<UIColor> {
        return Binder(self) { me, color in
            me.validationLabel.textColor = color
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func registNext() {
        switch baseScrollView.currentPage {
        case 1:
            print("1")
        case 2:
            print("1")
        case 3:
            print("1")
        default:
            break
        }
    }
    
    private enum ScrollDirection {
        case left
        case right
    }
    
    private func moveScroll(to direction: ScrollDirection, completion: @escaping () -> Void) {
        UIView.animate(withDuration: 0.6, delay: 0, options: .curveEaseInOut, animations: {
            switch direction {
            case .left:
                self.baseScrollView.contentOffset.x -= self.view.frame.width
            case .right:
                self.baseScrollView.contentOffset.x += self.view.frame.width
            }
        }) { _ in
            completion()
        }
    }
}

extension RegistViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case nameTextField:
            organizerTextField.becomeFirstResponder()
        case organizerTextField:
            moveScroll(to: .right) {
                self.sexTextField.becomeFirstResponder()
            }
        case sexTextField:
            ageTextField.becomeFirstResponder()
        case ageTextField:
            moveScroll(to: .right) {
                self.emailTextField.becomeFirstResponder()
            }
        case emailTextField:
            passwordTextField.becomeFirstResponder()
        case passwordTextField:
            passwordTextField.resignFirstResponder()
        default:
            return false
        }
        return true
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
        registButtonBottom.constant = keyboardHeight
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        registButtonBottom.constant = 0
    }
}
