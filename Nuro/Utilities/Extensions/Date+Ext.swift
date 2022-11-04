//
//  Date+Ext.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/10/22.
//

import Foundation

extension Date {
    func fixedFormat() -> String {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "dd MMM yyyy"
        return dateformat.string(from: self)
    }
    
    static func generateTimestampForFilename() -> String {
        let date = Date()
        let calendar = Calendar.current

        let year = calendar.component(.year, from:date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)

        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        let nanoSecond = calendar.component(.nanosecond, from: date)

        let timestamp = "Nuro_\(year)\(month)\(day)_\(hour)\(minute)\(second)\(nanoSecond)"
        
        return timestamp
    }
    
    func getLongIndonesianDate() -> String {
        
        let dateformat = DateFormatter()
        dateformat.locale = Locale(identifier: "id")
        dateformat.dateFormat = "EEEE, dd MMMM yyyy"
        return dateformat.string(from: self)
        
    }
    
    func getTickingTime() -> String {
        let date = Date()
        let calendar = Calendar.current
        var time: String = ""
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let seconds = calendar.component(.second, from: date)
        
        let hourString = hour < 10 ? "0\(hour)" : "\(hour)"
        let minuteString = minute < 10 ? "0\(minute)" : "\(minute)"
            
        time = "\(hourString):\(minuteString)"
        
        return time
    }
    
    func getCurrentWeekday() -> Int {
        let date = Date()
        let calendar = Calendar.current
        
        let weekday = calendar.component(.weekday, from: date) - 1
        
        return weekday
    }
    
    /// The compared time should be a String with the format of HH:mm
    func getTimeframe() -> String {
        let midnight = "00:00"
        
        let morning = "08:00"
        let afternoon = "12:00"
        let evening = "18:30"
        
        let curr = getTickingTime()
        
        if curr > midnight && curr < afternoon {
            return "Pagi"
        }
        else if curr > morning && curr < evening {
            return "Siang"
        }
        else {
            return "Malam"
        }
    }

    
}
