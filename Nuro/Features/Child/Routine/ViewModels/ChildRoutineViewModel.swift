//
//  ChildRoutineViewModel.swift
//  Nuro
//
//  Created by Karen Natalia on 06/10/22.
//

import Foundation

class ChildRoutineViewModel {
    
    var activities = [MirrorDetail]()
    
    private let mirrorDetailRepo = MirrorDetailLocalRepository.shared
    
    func loadActivities(dayID: Int, timeID: Int) {
        activities = mirrorDetailRepo.getMirrorDetails(timeID: timeID)
    }
    
    func removeFirstActivity() {
        activities.removeFirst()
    }
    
}
