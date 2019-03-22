//
//  SettingTableViewController.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/22.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    @IBOutlet private weak var versionLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        let version = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        versionLabel.text = version
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
