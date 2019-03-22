//
//  ProfileEditViewController.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/22.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import FontAwesome

class ProfileEditViewController: UITableViewController {
    
    @IBOutlet private weak var profileImageView: UIImageView!
    @IBOutlet private weak var editImageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.setImage(with: "https://pbs.twimg.com/profile_images/1061520538386915329/ExNUPGbF_400x400.jpg")
        editImageView.image = UIImage.fontAwesomeIcon(name: .camera, style: .regular, textColor: .clear, size: CGSize(width: 20, height: 20))
    }
}
