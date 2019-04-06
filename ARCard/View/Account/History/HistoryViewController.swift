//
//  HistoryViewController.swift
//  ARCard
//
//  Created by 築山朋紀 on 2019/04/07.
//  Copyright © 2019 tomoki. All rights reserved.
//

import UIKit

class HistoryViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(HistoryTableViewCell.nib, forCellReuseIdentifier: HistoryTableViewCell.name)
    }
    
    @IBAction private func backButtonDidTappend(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.name, for: indexPath) as? HistoryTableViewCell else {
            fatalError("Invalid cell")
        }
        cell.update()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let target = Storyboard.profile.instantiateViewController()
        navigationController?.pushViewController(target, animated: true)
    }
}
