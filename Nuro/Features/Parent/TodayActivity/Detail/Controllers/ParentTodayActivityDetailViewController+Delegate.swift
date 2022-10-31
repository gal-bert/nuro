//
//  ParentTodayActivityDetailViewController+Delegate.swift
//  Nuro
//
//  Created by Gregorius Albert on 24/10/22.
//

import Foundation

extension ParentTodayActivityDetailViewController: ParentTodayActivityDetailDelegate {
    func dismissViewController() {
        reloadDelegate.reloadTableView()
        dismiss(animated: true)
    }
    
    func deleteAction() {
        let alert = Alert.destructiveAlert(title: "", message: "Apakah anda ingin menghapus { } dari rutinitas ini?") {
            RoutineDetailLocalRepository.shared.delete(routineDetail: self.routineDetail ?? RoutineDetail())
            self.dismissViewController()
        }
        present(alert, animated: true)
    }

}
