//
//  AddActivityRoutineTimeViewController+Delegate.swift
//  Nuro
//
//  Created by Samuel Dennis on 30/10/22.
//

import UIKit

extension AddActivityRoutimeTimeViewController: ParentRoutineAddActivityRoutineTimeDelegate {
    
    func dismissViewController() {
        self.dismiss(animated: true)
    }
    
    func pushViewController(dest: UIViewController) {
        navigationController?.pushViewController(dest, animated: true)
    }
}

extension AddActivityRoutimeTimeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = addActivityRoutineTimeView.tableView.dequeueReusableCell(withIdentifier: PlainTableViewCell.identifier) as! PlainTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return ScreenSizes.modalHeight / 7
    }
    
}
