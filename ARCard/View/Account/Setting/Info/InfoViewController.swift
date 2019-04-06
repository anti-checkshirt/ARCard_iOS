//
//  InfoViewController.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/04/07.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class InfoViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "アプリについて"
    }
    
    @IBAction private func backButtonDidTappend(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
}
