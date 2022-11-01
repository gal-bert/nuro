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
        
        var timeString = ""
        var timesSorted = times
        timesSorted = timesSorted.sorted()
        
        for (index, time) in timesSorted.enumerated() {
            if index == 0 {
                if time == 0 {
                    timeString = "Pagi"
                }
                else if time == 1 {
                    timeString = "Siang"
                }
                else {
                    timeString = "Malam"
                }
            }
            else {
                timeString += ", "
                
                if time == 0 {
                    timeString += "Pagi"
                }
                else if time == 1 {
                    timeString += "Siang"
                }
                else {
                    timeString += "Malam"
                }
            }
        }
        parentRoutineAddActivityView.waktuRutinitasButton.rightLabel.text = timeString
    }
}
