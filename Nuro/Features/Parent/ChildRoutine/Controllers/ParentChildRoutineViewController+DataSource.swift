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
        cell.editButton.removeFromSuperview()
        cell.setupDelegate(vc: self)
        
        
        switch Date().getTimeframeId() {
        case 1:
            cell.timeframeLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.morning, text: "Pagi", colorName: Colors.Text.onyx)
            cell.backgroundColor = Colors.Background.water
            cell.collectionView.backgroundColor = cell.backgroundColor
            
        case 2:
            cell.timeframeLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.afternoon, text: "Siang", imageHeight: 40, yOffset: -8, colorName: Colors.Text.onyx)
            cell.backgroundColor = Colors.Background.papayaWhip
            cell.collectionView.backgroundColor = cell.backgroundColor
            
        case 3:
            cell.timeframeLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.night, text: "Malam", colorName: Colors.Text.onyx)
            cell.backgroundColor = Colors.Background.soap
            cell.collectionView.backgroundColor = cell.backgroundColor
            
        default:
            cell.timeframeLabel.text = "Empty"
        }
        cell.routines = viewModel.todaysRoutines
        
        return cell
    }
}
