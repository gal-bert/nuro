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
        
        Transition.animateTransition(vc: self)
        navigationController?.pushViewController(dest, animated: false)
    }
    
    func toPinUnlockView() {
        let dest = ChildPinUnlockViewController()
        dest.modalPresentationStyle = .fullScreen
        
        Transition.animateTransition(vc: self)
        navigationController?.pushViewController(dest, animated: false)
    }
}

extension ChildRoutineViewController: ChildRoutineAnimationDelegate {
    func triggerAnimation() {
        willBeAnimated = true
    }
}
