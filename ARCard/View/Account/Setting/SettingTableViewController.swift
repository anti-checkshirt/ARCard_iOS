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
        switch (indexPath.section, indexPath.row) {
        case (0, 0):
            print("プロフィール")
        case (0, 1):
            tableView.deselectRow(at: indexPath, animated: true)
            let alertController = AlertHandler.alertControllerForLogout()
            self.present(alertController, animated: true)
        case (0, 2):
            print("退会")
            tableView.deselectRow(at: indexPath, animated: true)
        case (1, 0):
            print("AR名刺を応援する")
            tableView.deselectRow(at: indexPath, animated: true)
        case (1, 1):
            print("不具合を報告する")
        case (1, 2):
            print("お問い合わせ")
        case (1, 3):
            print("アプリの使い方")
        case (2, 0):
            print("利用規約")
        case (2, 1):
            print("プライバシーポリシー")
        default:
            break
        }
    }
}
