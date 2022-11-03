//
//  ParentRoutineViewModel.swift
//  Nuro
//
//  Created by Samuel Dennis on 05/10/22.
//

import Foundation

class ParentRoutineViewModel {
    
    var routineHeaderRepo = RoutineHeaderLocalRepository.shared
    var routineDetailRepo = RoutineDetailLocalRepository.shared
    
    var morningActivities = [RoutineDetail]()
    var afternoonActivities = [RoutineDetail]()
    var eveningActivities = [RoutineDetail]()
    
    var routineHeaders = [RoutineHeader]()
    
    func loadAll(dayId: Int) {
        routineHeaders = routineHeaderRepo.getAll()
        
        loadActivities(dayId: dayId)

        // 1. load all activities
        // 2. Process to divide the data 3 section
    }
    
    func loadActivities(dayId: Int) {
        let startIndex = (dayId-1) * 3
        
        morningActivities = routineDetailRepo.getRoutineDetails(of: routineHeaders[startIndex])
        afternoonActivities = routineDetailRepo.getRoutineDetails(of: routineHeaders[startIndex+1])
        eveningActivities = routineDetailRepo.getRoutineDetails(of: routineHeaders[startIndex+2])
    }

    func getRoutineDetail(section:Int, row: Int) -> RoutineDetail {
        switch section {
        case 0: //Morning
            return morningActivities[row]
        case 1: //Afternoon
            return afternoonActivities[row]
        case 2: //Evening
            return eveningActivities[row]
        default:
            return RoutineDetail()
        }
    }


}
