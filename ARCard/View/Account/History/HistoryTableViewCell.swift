//
//  HistoryTableViewCell.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/04/07.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var iconImageView: IconImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var createAtLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    
    func update() {
        iconImageView.setImage(with: "https://pbs.twimg.com/profile_images/1061520538386915329/ExNUPGbF_400x400.jpg")
    }
}
