//
//  ChildActivityViewController+Delegate.swift
//  Nuro
//
//  Created by Karen Natalia on 04/11/22.
//

import Foundation

extension ChildActivityCompletedViewController: ChildActivityCompletedDelegate {
    func dismissViewController() {
        navigationController?.popToRootViewController(animated: true)
    }
}

