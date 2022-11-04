//
//  ChildRoutineViewController+Delegate.swift
//  Nuro
//
//  Created by Karen Natalia on 06/10/22.
//

import Foundation
import UIKit

extension ChildRoutineViewController: ChildRoutineDelegate {
    func animateNextActivity() {
        nextActivity()
    }
    
    func toActivityView() {
        let dest = ChildActivityViewController()
        dest.modalTransitionStyle = .crossDissolve
        dest.modalPresentationStyle = .fullScreen
        dest.routineDelegateReference = self
        dest.activity = viewModel.activities[0].activity
        navigationController?.pushViewController(dest, animated: true)
    }
    
    func toPinUnlockView() {
        let dest = ChildPinUnlockViewController()
        dest.modalPresentationStyle = .fullScreen
        dest.modalTransitionStyle = .crossDissolve
        self.present(dest, animated: true)
    }
}

extension ChildRoutineViewController: ChildRoutineAnimationDelegate {
    func triggerAnimation() {
        willBeAnimated = true
    }
}
