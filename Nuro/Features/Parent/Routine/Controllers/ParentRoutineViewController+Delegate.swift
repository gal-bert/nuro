//
//  ParentRoutineViewController+Delegate.swift
//  Nuro
//
//  Created by Samuel Dennis on 05/10/22.
//

import UIKit

extension ParentRoutineViewController: ParentRoutineDelegate {
    func printText(text: String) {
        viewModel.printText(text: text)
    }
}

extension ParentRoutineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = parentRoutineView.tableView.dequeueReusableCell(withIdentifier: ActivitiesTableViewCell.identifier) as! ActivitiesTableViewCell

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderTimeframeSection.identifier) as! HeaderTimeframeSection
        
        switch section {
        case 0:
            view.timeframeLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.morning, text: "Pagi", colorName: Colors.Text.onyx)
            
        case 1:
            view.timeframeLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.afternoon, text: "Siang", colorName: Colors.Text.onyx)
            
        case 2:
            view.timeframeLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.night, text: "Malam", colorName: Colors.Text.onyx)
            
        default:
            view.timeframeLabel.text = "Empty"
        }
        
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        print(indexPath)
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
}



