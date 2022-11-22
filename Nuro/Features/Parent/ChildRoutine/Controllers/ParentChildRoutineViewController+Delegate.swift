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

extension ParentChildRoutineViewController: ParentTodayActivityDelegate {
    func presentViewController(dest: UIViewController, modalHeight: CGFloat) {
        let vc = UINavigationController(rootViewController: dest)
        vc.modalPresentationStyle = .formSheet
        vc.preferredContentSize = .init(width: ScreenSizes.modalWidth, height: modalHeight)
        
        if let dest = dest as? ParentTodayActivityDetailViewController {
            dest.reloadDelegate = self
        }
        
        present(vc, animated: true)
    }
}

extension ParentChildRoutineViewController: ReloadDelegate {
    func reloadView() {
        viewModel.getTodaysRoutine()
        let cell = parentChildRoutineView.routineTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? ParentTodayActivityTableViewCell
        cell?.collectionView.reloadData()
        parentChildRoutineView.routineTableView.reloadData()
    }
}
