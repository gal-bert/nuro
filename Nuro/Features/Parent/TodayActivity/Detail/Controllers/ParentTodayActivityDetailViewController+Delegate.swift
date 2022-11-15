//
//  ParentTodayActivityDetailViewController+Delegate.swift
//  Nuro
//
//  Created by Gregorius Albert on 24/10/22.
//

import Foundation

extension ParentTodayActivityDetailViewController: ParentTodayActivityDetailDelegate {
    func dismissViewController() {
        reloadDelegate.reloadView()
        dismiss(animated: true)
    }
    
    func deleteAction() {
        let alert = Alert.destructiveAlert(title: "", message: "Apakah anda ingin menghapus \"\(detail?.activity?.activityName ?? "")\" dari rutinitas ini?") { [self] in
            
            if detail is MirrorDetail {
                MirrorDetailLocalRepository.shared.delete(mirrorDetail: (detail as? MirrorDetail) ?? MirrorDetail())
            }
            else if detail is RoutineDetail {
                RoutineDetailLocalRepository.shared.delete(routineDetail: (detail as? RoutineDetail) ?? RoutineDetail())
            }
            dismissViewController()
            
        }
        present(alert, animated: true)
    }

}
