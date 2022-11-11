//
//  UserDefaults.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/11/22.
//

import UIKit

class UserDefaultsHelper {
    
    enum Keys {
        static let morningTime = "MORNING_TIME"
        static let afternoonTime = "AFTERNOON_TIME"
        static let eveningTime = "EVENING_TIME"
        static let isFirstTime = "IS_FIRST_TIME"
        static let parentsName = "PARENTS_NAME"
        static let kidsName = "KIDS_NAME"
        static let isLocked = "IS_LOCKED"
        static let lastWeekdayId = "LAST_WEEKDAY_ID"
    }
    
    static func registerDefaultValue() -> Void {
        UserDefaults.standard.register(
            defaults: [
                Keys.morningTime : "08:00",
                Keys.afternoonTime: "12:00",
                Keys.eveningTime: "18:00",
                Keys.isFirstTime: true,
                Keys.parentsName: "Orang Tua",
                Keys.kidsName: "Anak",
                Keys.isLocked: false,
                Keys.lastWeekdayId: -1
            ]
        )
    }
    
}
