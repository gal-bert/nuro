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
    
    func generateTimestampForFilename() -> String {
        let date = Date()
        let calendar = Calendar.current

        let year = calendar.component(.year, from:date)
        let month = calendar.component(.month, from: date)
        let day = calendar.component(.day, from: date)

        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)

        let timestamp = "Nuro_\(year)\(month)\(day)_\(hour)\(minute)\(second)"
        
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
    
}
