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
//        coachMarksController.flow.showNext()
    }
    
    func hintPopover() {
        let dest = GuidedAccessPopOverViewController()
        dest.modalPresentationStyle = .popover

        dest.popoverPresentationController?.sourceView = parentChildRoutineView.hintButton
        dest.popoverPresentationController?.permittedArrowDirections = .down
        dest.preferredContentSize = CGSize(width: ScreenSizes.screenWidth / 3, height: ScreenSizes.screenHeight / 4)

        self.present(dest, animated: true)
    }
}
