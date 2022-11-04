//
//  ChildActivityViewController+Delegate.swift
//  Nuro
//
//  Created by Karen Natalia on 01/11/22.
//

import Foundation

extension ChildActivityViewController: ChildActivityDelegate {
    func toActivityCompleted() {
        let dest = ChildActivityCompletedViewController()
        dest.modalPresentationStyle = .fullScreen
        dest.modalTransitionStyle = .crossDissolve
        dest.setDelegate(reference: routineDelegateReference ?? ChildRoutineViewController())
        
        Transition.animateTransition(vc: self)
        navigationController?.pushViewController(dest, animated: false)
    }
}
