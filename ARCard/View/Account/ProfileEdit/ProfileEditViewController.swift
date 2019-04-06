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
    
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var editImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "プロフィール編集"
        profileImageView.setImage(with: "https://pbs.twimg.com/profile_images/1061520538386915329/ExNUPGbF_400x400.jpg")
        editImageView.image = UIImage.fontAwesomeIcon(name: .camera, style: .solid, textColor: .white, size: CGSize(width: 5, height: 5))
    }
    
    @IBAction private func backButtonDidTappend(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
