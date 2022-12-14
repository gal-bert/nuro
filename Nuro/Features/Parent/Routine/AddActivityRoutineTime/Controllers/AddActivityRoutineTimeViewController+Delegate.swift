//
//  AddActivityRoutineTimeViewController+Delegate.swift
//  Nuro
//
//  Created by Samuel Dennis on 30/10/22.
//

import UIKit

extension AddActivityRoutimeTimeViewController: ParentRoutineAddActivityRoutineTimeDelegate {
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    func pushViewController(dest: UIViewController) {
        navigationController?.pushViewController(dest, animated: true)
    }
}

extension AddActivityRoutimeTimeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addActivityRoutineTimeView.tableView.dequeueReusableCell(withIdentifier: PlainTableViewCell.identifier) as! PlainTableViewCell

        cell.cellLabel.text = addActivityRoutineTimeViewModel.time[indexPath.row]
        
        if addActivityRoutineTimeViewModel.timeSelected.contains(indexPath.row) {
            cell.accessoryType = .checkmark
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)!
        
        if cell.accessoryType == .checkmark {
            cell.accessoryType = .none
        } else {
            cell.accessoryType = .checkmark
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addActivityRoutineTimeViewModel.time.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ScreenSizes.modalHeight / 7
    }
    
}
