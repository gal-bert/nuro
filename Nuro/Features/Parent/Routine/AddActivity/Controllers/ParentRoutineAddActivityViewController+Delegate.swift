//
//  ParentRoutineAddActivityViewController+Delegate.swift
//  Nuro
//
//  Created by Samuel Dennis on 24/10/22.
//

import UIKit

extension ParentRoutineAddActivityViewController: ParentRoutineAddActivityDelegate {
    func dismissViewController() {
        self.dismiss(animated: true)
    }
    
    func pushViewController(dest: UIViewController) {
        navigationController?.pushViewController(dest, animated: true)
    }
}

extension ParentRoutineAddActivityViewController: ParentRoutineDataDelegate {
    func sendResult(times: [Int]) {
        
        var timesSorted = times
        timesSorted = timesSorted.sorted()
        parentRoutineAddActivityView.waktuRutinitasButton.rightLabel.text = TimeToIdConverter.idToTime(times: timesSorted)
    }
}
