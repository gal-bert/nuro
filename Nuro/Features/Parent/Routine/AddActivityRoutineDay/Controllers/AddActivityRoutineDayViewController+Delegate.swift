//
//  AddActivityRoutineDayViewController+Delegate.swift
//  Nuro
//
//  Created by Samuel Dennis on 31/10/22.
//

import UIKit

extension AddActivityRoutineDayViewController: ParentRoutineAddActivityRoutineDayDelegate {
    
    func popViewController() {
        navigationController?.popViewController(animated: true)
    }
    
    func pushViewController(dest: UIViewController) {
        navigationController?.pushViewController(dest, animated: true)
    }
}

extension AddActivityRoutineDayViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addActivityRoutineDayView.tableView.dequeueReusableCell(withIdentifier: PlainTableViewCell.identifier) as! PlainTableViewCell
        cell.selectionStyle = .none
        cell.cellLabel.text = addActivityRoutineDayViewModel.days[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return addActivityRoutineDayViewModel.days.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ScreenSizes.modalHeight / CGFloat(addActivityRoutineDayViewModel.days.count)
    }
    
}
