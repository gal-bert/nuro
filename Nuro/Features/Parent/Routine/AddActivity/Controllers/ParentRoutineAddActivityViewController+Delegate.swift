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
        parentRoutineAddActivityView.iconChooseImageView.isHidden = true
        parentRoutineAddActivityView.choosenImageView.isHidden = false
        parentRoutineAddActivityView.choosenImageView.image = Document.getImageFromDocument(imageURL: activity.activityImageURL)
        parentRoutineAddActivityView.labelContainer.isHidden = false
        parentRoutineAddActivityView.activityName.text = activity.activityName
        
        parentRoutineAddActivityView.validateEmptyField()
    }
}

extension ParentRoutineAddActivityViewController: ParentRoutineAddActivityDelegate {
    func dismissViewController() {
        reloadDelegate?.reloadView()
        self.dismiss(animated: true)
    }
    
    func pushViewController(dest: UIViewController) {
//        coachMarksController.flow.showNext()
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
//        coachMarksController.flow.showNext()
    }
}

extension ParentRoutineAddActivityViewController: ParentRoutineAddActivityTimeDataDelegate, ParentRoutineAddActivityDayDataDelegate {
    func sendTimesResult(times: [Int]) {
        var timesSorted = times
        timesSorted = timesSorted.sorted()
        self.times = timesSorted
        
        if times.isEmpty {
            parentRoutineAddActivityView.waktuRutinitasButton.rightLabel.attributedText = AddActivityRoutineDayTimeConfiguration.getAttributedText(grayText: "Belum dipilih", text: "")
        } else {
            parentRoutineAddActivityView.waktuRutinitasButton.rightLabel.attributedText = AddActivityRoutineDayTimeConfiguration.getAttributedText(grayText: "", text: "\(TimeToIdConverter.idToTime(times: timesSorted))")
        }
        
        parentRoutineAddActivityView.validateEmptyField()
    }
    
    func sendDaysResult(days: [Int]) {
        var daysSorted = days
        daysSorted = daysSorted.sorted()
        self.days = daysSorted
        
        if days.isEmpty {
            parentRoutineAddActivityView.hariRutinitasButton.rightLabel.attributedText = AddActivityRoutineDayTimeConfiguration.getAttributedText(grayText: "Belum dipilih", text: "")
        } else {
            parentRoutineAddActivityView.hariRutinitasButton.rightLabel.attributedText = AddActivityRoutineDayTimeConfiguration.getAttributedText(grayText: "", text: "\(DayToIdConverted.idToDay(days: daysSorted))")
        }
        
        parentRoutineAddActivityView.validateEmptyField()
    }
}
