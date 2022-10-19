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
