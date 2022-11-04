//
//  DayToIdConverter.swift
//  Nuro
//
//  Created by Samuel Dennis on 02/11/22.
//

import UIKit

class DayToIdConverted {
    
    static func idToDay(days: [Int]) -> String{
        
        var dayString = ""
        
        for (index, day) in days.enumerated() {
            if index == 0 {
                if day == 0 {
                    dayString = "Senin"
                }
                else if day == 1 {
                    dayString = "Selasa"
                }
                else if day == 2 {
                    dayString = "Rabu"
                }
                else if day == 3 {
                    dayString = "Kamis"
                }
                else if day == 4 {
                    dayString = "Jumat"
                }
                else if day == 5 {
                    dayString = "Sabtu"
                }
                else {
                    dayString = "Minggu"
                }
            }
            else {
                dayString += ", "
                if day == 0 {
                    dayString += "Senin"
                }
                else if day == 1 {
                    dayString += "Selasa"
                }
                else if day == 2 {
                    dayString += "Rabu"
                }
                else if day == 3 {
                    dayString += "Kamis"
                }
                else if day == 4 {
                    dayString += "Jumat"
                }
                else if day == 5 {
                    dayString += "Sabtu"
                }
                else {
                    dayString += "Minggu"
                }
            }
        }
        return dayString
    }
    
}

