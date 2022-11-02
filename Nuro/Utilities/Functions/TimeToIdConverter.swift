//
//  DayIdConverter.swift
//  Nuro
//
//  Created by Samuel Dennis on 01/11/22.
//

import UIKit

class TimeToIdConverter {
    
    static func idToTime(times: [Int]) -> String{
        
        var timeString = ""
        
        for (index, time) in times.enumerated() {
            if index == 0 {
                if time == 0 {
                    timeString = "Pagi"
                }
                else if time == 1 {
                    timeString = "Siang"
                }
                else {
                    timeString = "Malam"
                }
            }
            else {
                timeString += ", "
                
                if time == 0 {
                    timeString += "Pagi"
                }
                else if time == 1 {
                    timeString += "Siang"
                }
                else {
                    timeString += "Malam"
                }
            }
        }
        return timeString
    }
    
}
