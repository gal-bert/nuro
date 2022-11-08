//
//  ParentChildRoutineViewController+Delegate.swift
//  Nuro
//
//  Created by Karen Natalia on 17/10/22.
//

import Foundation
import UIKit

extension ParentChildRoutineViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.frame.height - 80
    }
}

extension ParentChildRoutineViewController: ParentChildRoutineDelegate {
    func toChildMode() {
        let dest = ChildStarterViewController()
        dest.modalPresentationStyle = .fullScreen
        
        let nav = UINavigationController(rootViewController: dest)
        nav.modalPresentationStyle = .fullScreen
        nav.modalTransitionStyle = .coverVertical
        
        self.present(nav, animated: true)
    }
}
