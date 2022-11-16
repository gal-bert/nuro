//
//  MirrorData.swift
//  Nuro
//
//  Created by Gregorius Albert on 16/11/22.
//

import Foundation

class MirrorData {
    static func startMirror() -> Void {
        if UserDefaults.standard.integer(forKey: UserDefaultsHelper.Keys.lastWeekdayId) != Date().getCurrentWeekday(){
            UserDefaults.standard.set(Date().getCurrentWeekday(), forKey: UserDefaultsHelper.Keys.lastWeekdayId)
            
            let routineHeaders = RoutineHeaderLocalRepository.shared.getRoutinesOfDay(dayID: Date().getCurrentWeekday())
            
            MirrorHeaderLocalRepository.shared.truncate()
            
            for i in routineHeaders {
                MirrorHeaderLocalRepository.shared.add(dayID: Date().getCurrentWeekday(), timeID: Int(i.timeID))
                let routineDetails = RoutineDetailLocalRepository.shared.getRoutineDetails(dayID: Date().getCurrentWeekday(), timeID: Int(i.timeID))
                for j in routineDetails {
                    MirrorDetailLocalRepository.shared.add(timeID: Int(i.timeID), activity: j.activity ?? Activity())
                }
            }
        }
    }
}
