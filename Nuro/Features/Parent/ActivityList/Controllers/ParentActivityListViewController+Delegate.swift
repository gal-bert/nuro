//
//  ParentActivityListViewController+Delegate.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 05/10/22.
//

import Foundation

extension ParentActivityListViewController: ParentActivityListDelegate {
    func printText(text: String) {
        viewModel.printText(text: text)
    }
}
