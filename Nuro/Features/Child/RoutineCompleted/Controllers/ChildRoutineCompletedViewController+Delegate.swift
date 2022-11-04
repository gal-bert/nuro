//
//  ChildRoutineCompletedViewController+Delegate.swift
//  Nuro
//
//  Created by Karen Natalia on 04/11/22.
//

import Foundation

extension ChildRoutineCompletedViewController: ChildRoutineCompletedDelegate {
    func toParentMode() {
        let dest = ChildPinUnlockViewController()
        dest.modalPresentationStyle = .fullScreen
        dest.modalTransitionStyle = .crossDissolve
        present(dest, animated: true)
    }
}
