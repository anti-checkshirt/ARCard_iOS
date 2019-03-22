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
        switch indexPath.section {
        case 0:
            switch indexPath.row {
            case 0:
                print("プロフィール編集")
            case 1:
                print("ログアウト")
            case 2:
                print("退会")
            default:
                break
            }
        case 1:
            switch indexPath.row {
            case 0:
                print("AR名刺を応援する")
            case 1:
                print("不具合を報告する")
            case 2:
                print("お問い合わせ")
            case 3:
                print("アプリの使い方")
            default:
                break
            }
        case 2:
            switch indexPath.row {
            case 0:
                print("利用規約")
            case 1:
                print("プライバシーポリシー")
            default:
                break
            }
        case 3:
            switch indexPath.row {
            case 0:
                print("バージョン")
            default:
                break
            }
        default:
            break
        }
    }
}
