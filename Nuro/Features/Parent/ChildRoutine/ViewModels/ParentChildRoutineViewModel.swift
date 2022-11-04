//
//  ParentChildRoutineViewModel.swift
//  Nuro
//
//  Created by Karen Natalia on 01/11/22.
//

import Foundation

class ParentChildRoutineViewModel {
    
    var todaysRoutines = [RoutineDetail]()
    
    func getTodaysRoutine() {
        todaysRoutines = RoutineDetailLocalRepository.shared.getRoutineDetails(dayID: Date().getCurrentWeekday(), timeID: Date().getTimeframeId())
    }
    
}
