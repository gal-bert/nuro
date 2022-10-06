//
//  ParentTodayActivityViewController+Delegate.swift
//  Nuro
//
//  Created by Gregorius Albert on 05/10/22.
//

import UIKit

extension ParentTodayActivityViewController: ParentTodayActivityDelegate {
    func printText(text: String) {
        viewModel.printText(text: text)
    }
}

extension ParentTodayActivityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = parentTodayActivityView.tableView.dequeueReusableCell(withIdentifier: ParentActivityTableViewCell.identifier) as! ParentActivityTableViewCell

        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.loadTableView().count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constants.COLLECTION_VIEW_CELL_HEIGHT) + 50.0
    }
}
