//
//  ChildRoutineViewModel.swift
//  Nuro
//
//  Created by Karen Natalia on 06/10/22.
//

import Foundation

class ChildRoutineViewModel {
    
    // MARK: Dummy data
    var activityName = ["Aktivitas 1", "Aktivitas 2", "Aktivitas 3", "Aktivitas 4", "Aktivitas 5"]
    var activityImageName = ["face.smiling", "pencil", "square.and.arrow.up", "cup.and.saucer.fill", "bed.double.fill"]
    
    func removeFirstActivity() {
        activityName.removeFirst()
        activityImageName.removeFirst()
    }
    
}
