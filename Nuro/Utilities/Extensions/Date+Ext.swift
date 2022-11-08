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
        
        let hourString = hour < 10 ? "0\(hour)" : "\(hour)"
        let minuteString = minute < 10 ? "0\(minute)" : "\(minute)"
            
        time = "\(hourString):\(minuteString)"
        
        return time
    }
    
    func formatForDatepicker(value: String) -> Date {
        
        let dateStr = value
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "id")
        dateFormatter.dateFormat = "HH:mm"
        let date = dateFormatter.date(from: dateStr) ?? Date()

        return date
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
        
        let morning = UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.morningTime) ?? "08:00"
        let afternoon = UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.afternoonTime) ?? "12:00"
        let evening = UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.eveningTime) ?? "18:30"
        
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
    
    func getTimeframeId() -> Int {
        switch getTimeframe() {
        case "Pagi":
            return 1
            
        case "Siang":
            return 2
            
        case "Malam":
            return 3
            
        default:
            return 1
        }
    }
    
    

    
}
