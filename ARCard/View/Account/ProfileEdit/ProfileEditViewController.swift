//
//  ProfileEditViewController.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/22.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import PKHUD
import RxSwift
import RxCocoa
import FontAwesome

class ProfileEditViewController: UITableViewController {
    
    private let disposeBag = DisposeBag()
    
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var editImageView: UIImageView!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var organizerTextField: UITextField!
    @IBOutlet private weak var sexTextField: UITextField!
    @IBOutlet private weak var ageTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "プロフィール編集"
        profileImageView.setImage(with: "https://pbs.twimg.com/profile_images/1061520538386915329/ExNUPGbF_400x400.jpg")
        editImageView.image = UIImage.fontAwesomeIcon(name: .camera, style: .solid, textColor: .white, size: CGSize(width: 5, height: 5))
        
        let doneButton = UIBarButtonItem(title: "保存", style: .done, target: nil, action: #selector(saveButtonTappend))
        navigationItem.rightBarButtonItem = doneButton
        
        nameTextField.text = "ともき"
        organizerTextField.text = "iOS Engineer"
        sexTextField.text = "男性"
        ageTextField.text = "2002/03/11"
    }
    
    @objc private func saveButtonTappend() {
        HUD.flash(.success, onView: view, delay: 2.0) { _ in
            self.dismiss(animated: true)
        }
    }
}

extension ProfileEditViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
