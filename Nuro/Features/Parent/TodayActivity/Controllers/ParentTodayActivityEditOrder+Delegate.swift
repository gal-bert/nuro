//
//  ParentTodayActivityEditOrderDelegate.swift
//  Nuro
//
//  Created by Gregorius Albert on 18/10/22.
//

import UIKit

extension ParentTodayActivityEditOrderViewController: ParentTodayActivityEditOrderDelegate {
    func dismissViewController() {
        self.dismiss(animated: true)
    }
    
    func pushViewController(dest: UIViewController) {
        navigationController?.pushViewController(dest, animated: true)
    }
}


extension ParentTodayActivityEditOrderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = parentTodayActivityEditOrderView.tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = arr[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
}
