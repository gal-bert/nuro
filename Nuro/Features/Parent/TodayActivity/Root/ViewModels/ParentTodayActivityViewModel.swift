//
//  ParentTodayActivityViewModel.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/10/22.
//

import Foundation

class ParentTodayActivityViewModel {

	var routineRepository = MirrorHeaderLocalRepository.shared
	var mirrorDetailRepo = MirrorDetailLocalRepository.shared

	var morningActivities = [MirrorDetail]()
	var afternoonActivities = [MirrorDetail]()
	var eveningActivities = [MirrorDetail]()


	func loadAll(dayId: Int) {
		morningActivities = mirrorDetailRepo.getMirrorDetails(timeID: 1)
		afternoonActivities = mirrorDetailRepo.getMirrorDetails(timeID: 2)
		eveningActivities = mirrorDetailRepo.getMirrorDetails(timeID: 3)
	}



    
    
}
