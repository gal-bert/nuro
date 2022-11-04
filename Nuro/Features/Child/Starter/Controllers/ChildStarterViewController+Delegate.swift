//
//  ChildStarterViewController+Delegate.swift
//  Nuro
//
//  Created by Karen Natalia on 01/11/22.
//

import Foundation
import UIKit

extension ChildStarterViewController: ChildStarterDelegate {
    func toRoutineView() {
        let dest = ChildRoutineViewController()
        dest.modalPresentationStyle = .fullScreen
        dest.modalTransitionStyle = .crossDissolve
        
        let nav = UINavigationController(rootViewController: dest)
        nav.modalPresentationStyle = .fullScreen
        
        Transition.animateTransition(vc: self)
        self.present(nav, animated: false)
    }
    func backToParentsMode() {
        self.dismiss(animated: true)
    }
}
