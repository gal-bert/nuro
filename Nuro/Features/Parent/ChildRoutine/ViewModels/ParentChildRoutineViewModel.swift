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
        todaysRoutines = MirrorDetailLocalRepository.shared.getMirrorDetails(timeID: Date().getTimeframeId())
    }
    
}
