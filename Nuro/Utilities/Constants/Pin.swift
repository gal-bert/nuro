//
//  Pin.swift
//  Nuro
//
//  Created by Karen Natalia on 16/11/22.
//

import Foundation

enum Pin {
    
    static let youngestAge = 20
    static let oldestAge = 65
    static let minimumYear = PinConverter.getYearDifference(age: oldestAge)
    static let maximumYear = PinConverter.getYearDifference(age: youngestAge)
    
}
