//
//  DebugViewController.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/03/22.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit
import Firebase

class DebugViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.section, indexPath.row) {
        case (3, 0):
            print("ie")
            Auth.auth().createUser(withEmail: "tomoki69386@gmail.com", password: "ghoeghoeg") { (_, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                print("アカウントを作った")
            }
        case (3, 1):
            let currentUser = Auth.auth().currentUser
            currentUser?.getIDToken(completion: { (idToken, error) in
                if let error = error {
                    print(error.localizedDescription)
                }
                print(idToken)
            })
        default:
            break
        }
    }
}
