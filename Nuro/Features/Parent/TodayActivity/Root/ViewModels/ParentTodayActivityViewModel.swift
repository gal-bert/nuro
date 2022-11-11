//
//  ParentTodayActivityViewModel.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/10/22.
//

import Foundation

class ParentTodayActivityViewModel {

	let activities = [RoutineHeaderModel]()

	var routineRepository = RoutineHeaderLocalRepository.shared
	var routineDetailRepo = RoutineDetailLocalRepository.shared

	var morningActivities = [RoutineDetail]()
	var afternoonActivities = [RoutineDetail]()
	var eveningActivities = [RoutineDetail]()
    
    //TODO: Change to MirrorDetail


	func loadAll(dayId: Int) {
		morningActivities = routineDetailRepo.getRoutineDetails(dayID: dayId, timeID: 1)
		afternoonActivities = routineDetailRepo.getRoutineDetails(dayID: dayId, timeID: 2)
		eveningActivities = routineDetailRepo.getRoutineDetails(dayID: dayId, timeID: 3)
	}

}
