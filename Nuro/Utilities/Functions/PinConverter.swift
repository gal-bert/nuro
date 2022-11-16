//
//  PinConverter.swift
//  Nuro
//
//  Created by Karen Natalia on 16/11/22.
//

import Foundation

class PinConverter {
    
    static func pinArrayToInt(pinArray: [Int]) -> Int {
        var result = 0
        var multiplier = 1000
        
        for pin in pinArray {
            result += (pin * multiplier)
            multiplier /= 10
        }
        
        return result
    }
    
    static func getYearDifference(age: Int) -> Int {
        let result = Calendar.current.date(byAdding: .year, value: -age, to: Date()) ?? Date()
        return Calendar.current.component(.year, from: result)
    }
    
}
