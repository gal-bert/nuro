//
//  ParentRoutineAddActivityViewController+Delegate.swift
//  Nuro
//
//  Created by Samuel Dennis on 24/10/22.
//

import UIKit

extension ParentRoutineAddActivityViewController: AddActivityToRoutineDelegate {
    func addActivityToRoutine(activity: Activity) {
        self.activity = activity
        parentRoutineAddActivityView.iconChooseImageView.image = Document.getImageFromDocument(imageURL: activity.activityImageURL)
        parentRoutineAddActivityView.selectImageLabel.text = activity.activityName
    }
}

extension ParentRoutineAddActivityViewController: ParentRoutineAddActivityDelegate {
    func dismissViewController() {
        reloadDelegate?.reloadView()
        self.dismiss(animated: true)
    }
    
    func pushViewController(dest: UIViewController) {
        navigationController?.pushViewController(dest, animated: true)
    }
    
    func saveActivity() {
        let routineRepo = RoutineDetailLocalRepository.shared
        
        for day in days! {
            for time in times! {
                routineRepo.add(dayID: day+1, timeID: time+1, activity: activity ?? Activity())
            }
        }
        dismissViewController()
    }
}

extension ParentRoutineAddActivityViewController: ParentRoutineAddActivityTimeDataDelegate, ParentRoutineAddActivityDayDataDelegate {
    func sendTimesResult(times: [Int]) {
        var timesSorted = times
        timesSorted = timesSorted.sorted()
        self.times = timesSorted
        parentRoutineAddActivityView.waktuRutinitasButton.rightLabel.text = TimeToIdConverter.idToTime(times: timesSorted)
    }
    
    func sendDaysResult(days: [Int]) {
        var daysSorted = days
        daysSorted = daysSorted.sorted()
        self.days = daysSorted
        parentRoutineAddActivityView.hariRutinitasButton.rightLabel.text = DayToIdConverted.idToDay(days: daysSorted)
    }
}
