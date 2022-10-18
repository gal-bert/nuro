//
//  ParentActivityListViewController+Delegate.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 05/10/22.
//

import UIKit

extension ParentActivityListViewController: ParentActivityListDelegate {
    func printText(text: String) {
        viewModel.printText(text: text)
    }
}

extension ParentActivityListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       guard let cell = parentActivityListView.tableViewFolder.dequeueReusableCell(withIdentifier: ParentActivityFolderTableViewCell.identifier) as? ParentActivityFolderTableViewCell
        else {
            return UITableViewCell()
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.loadDataToTableView().count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(CollectionViewAttributes.collectionViewFolderCellHeight) * 3
    }
}
