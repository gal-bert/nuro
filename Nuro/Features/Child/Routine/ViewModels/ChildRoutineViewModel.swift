//
//  ChildRoutineViewModel.swift
//  Nuro
//
//  Created by Karen Natalia on 06/10/22.
//

import Foundation

class ChildRoutineViewModel {
    
    var activities = [RoutineDetail]()
    
    private let routineDetailRepo = RoutineDetailLocalRepository.shared
    
    func loadActivities(dayID: Int, timeID: Int) {
        activities = routineDetailRepo.getRoutineDetails(dayID: dayID, timeID: timeID)
        //TODO: Change to Mirror Repository
    }
    
    func removeFirstActivity() {
        activities.removeFirst()
    }
    
}
