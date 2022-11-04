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
        
        Transition.animateTransition(vc: self)
        navigationController?.pushViewController(dest, animated: false)
    }
}
