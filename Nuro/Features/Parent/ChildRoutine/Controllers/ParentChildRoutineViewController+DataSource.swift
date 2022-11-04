//
//  ParentChildRoutineViewController+DataSource.swift
//  Nuro
//
//  Created by Karen Natalia on 17/10/22.
//

import Foundation
import UIKit

extension ParentChildRoutineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ParentTodayActivityTableViewCell.identifier) as? ParentTodayActivityTableViewCell else {
            return UITableViewCell()
        }
        
        cell.isViewingChildRoutine = true
        
        // TODO: Sync text and collection view item based on routine time
        cell.timeframeLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.morning, text: "Pagi", colorName: Colors.Text.onyx)
        cell.backgroundColor = Colors.Background.water
        cell.collectionView.backgroundColor = cell.backgroundColor
        cell.routines = viewModel.todaysRoutines
        
        return cell
    }
}
