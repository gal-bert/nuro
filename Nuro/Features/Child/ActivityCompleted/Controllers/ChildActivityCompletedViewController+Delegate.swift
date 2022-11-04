//
//  ChildActivityViewController+Delegate.swift
//  Nuro
//
//  Created by Karen Natalia on 04/11/22.
//

import Foundation

extension ChildActivityCompletedViewController: ChildActivityCompletedDelegate {
    func dismissViewController() {
        Transition.animateTransition(vc: self)
        navigationController?.popToRootViewController(animated: false)
    }
}

