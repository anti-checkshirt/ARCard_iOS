//
//  ProfileDescriptionViewController.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/22.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class ProfileDescriptionViewController: UIViewController {
    
    @IBOutlet private weak var descriptionTextViewBottom: NSLayoutConstraint!
    @IBOutlet private weak var descriptionTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureObserver()
        navigationItem.title = "紹介文の編集"
        descriptionTextView.becomeFirstResponder()
    }
}

// MARK: Notification

extension ProfileDescriptionViewController {
    private func configureObserver() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @objc private func keyboardWillShow(notification: Notification) {
        guard let keyboardHeight = notification.keyboardFrameEnd?.height else { return }
        descriptionTextViewBottom.constant = keyboardHeight
    }
    
    @objc private func keyboardWillHide(notification: Notification) {
        descriptionTextViewBottom.constant = 0
    }
}
