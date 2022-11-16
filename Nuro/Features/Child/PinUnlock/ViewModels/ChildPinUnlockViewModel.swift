//
//  ChildPinUnlockViewModel.swift
//  Nuro
//
//  Created by Karen Natalia on 31/10/22.
//

import UIKit

class ChildPinUnlockViewModel {
    
    var pin = [Int]()
    
    var dummyCorrectPin = [1, 1, 1, 1]
    
    func checkPin() -> Bool {
        let pinNumber = PinConverter.pinArrayToInt(pinArray: pin)
        if pinNumber >= Pin.minimumYear, pinNumber <= Pin.maximumYear {
            pin.removeAll()
            return true
        }
        else {
            pin.removeAll()
            return false
        }
    }
    
    func removeLastPin() -> Bool {
        if pin.count > 0 {
            pin.removeLast()
            return true
        }
        return false
    }
}
