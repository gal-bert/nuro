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
        
        Transition.animateTransition(vc: self)
        navigationController?.pushViewController(dest, animated: false)
    }
    
    func backToParentsMode() {
        self.dismiss(animated: true)
    }
}
