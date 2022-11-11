//
//  ParentChildRoutineViewModel.swift
//  Nuro
//
//  Created by Karen Natalia on 01/11/22.
//

import Foundation

class ParentChildRoutineViewModel {
    
    var todaysRoutines = [MirrorDetail]()
    
    func getTodaysRoutine() {
//        todaysRoutines = RoutineDetailLocalRepository.shared.getRoutineDetails(dayID: Date().getCurrentWeekday(), timeID: Date().getTimeframeId())
        //TODO: Change to Mirror Repository
        todaysRoutines = MirrorDetailLocalRepository.shared.getMirrorDetails(timeID: Date().getTimeframeId())
    }
    
}
