//
//  ParentRoutineViewController+Delegate.swift
//  Nuro
//
//  Created by Samuel Dennis on 05/10/22.
//

import Foundation

extension ParentRoutineViewController: ParentRoutineDelegate {
    func printText() {
        viewModel.printText()
    }
}
