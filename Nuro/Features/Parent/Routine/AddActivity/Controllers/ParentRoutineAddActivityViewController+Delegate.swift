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

extension ParentRoutineAddActivityViewController: ParentRoutineAddActivityTimeDataDelegate, ParentRoutineAddActivityDayDataDelegate {
    func sendTimesResult(times: [Int]) {
        
        var timesSorted = times
        timesSorted = timesSorted.sorted()
        parentRoutineAddActivityView.waktuRutinitasButton.rightLabel.text = TimeToIdConverter.idToTime(times: timesSorted)
    }
    
    func sendDaysResult(days: [Int]) {
        
        var daysSorted = days
        daysSorted = daysSorted.sorted()
        parentRoutineAddActivityView.hariRutinitasButton.rightLabel.text = DayToIdConverted.idToDay(days: daysSorted)
    }
}
