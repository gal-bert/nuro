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

    func presentViewController(dest: UIViewController) {
        present(UINavigationController(rootViewController: dest), animated: true)
    }
    
}

extension ParentTodayActivityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = parentTodayActivityView.tableView.dequeueReusableCell(withIdentifier: ParentTodayActivityTableViewCell.identifier) as! ParentTodayActivityTableViewCell
        
        cell.setupDelegate(vc: self)
        
        switch indexPath.section {
        case 0:
            cell.timeframeLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.morning, text: "Pagi", colorName: Colors.Text.onyx)
            cell.backgroundColor = Colors.Background.water
            cell.collectionView.backgroundColor = cell.backgroundColor
    
        case 1:
            cell.timeframeLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.afternoon, text: "Siang", imageHeight: 40, yOffset: -8, colorName: Colors.Text.onyx)
            cell.backgroundColor = Colors.Background.papayaWhip
            cell.collectionView.backgroundColor = cell.backgroundColor
        
        case 2:
            cell.timeframeLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.night, text: "Malam", colorName: Colors.Text.onyx)
            cell.backgroundColor = Colors.Background.soap
            cell.collectionView.backgroundColor = cell.backgroundColor
            
        default:
            cell.timeframeLabel.text = "Empty"
        }
        
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(CollectionViewAttributes.collectionViewCellHeight) + 110.0
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
}
