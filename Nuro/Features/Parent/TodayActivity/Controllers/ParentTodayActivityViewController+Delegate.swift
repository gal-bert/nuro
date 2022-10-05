//
//  ParentTodayActivityViewController+Delegate.swift
//  Nuro
//
//  Created by Gregorius Albert on 05/10/22.
//

import Foundation

extension ParentTodayActivityViewController: ParentTodayActivityDelegate {
    func printText() {
        viewModel.printText()
    }
}
