//
//  ScreenSizes.swift
//  Nuro
//
//  Created by Karen Natalia on 09/10/22.
//

import Foundation
import UIKit

enum ScreenSizes {
    
    static let screenWidth = UIScreen.main.bounds.width
    static let screenHeight = UIScreen.main.bounds.height
    
    static let halfScreenHeight = screenHeight / 2
    static let halfScreenWidth = screenWidth / 2
    
    static let quarterScreenHeight = screenHeight / 4
    static let quarterScreenWidth = screenWidth / 4
    
    static let modalHeight = halfScreenHeight * 1.5
    static let smallModalHeight = screenHeight * 5/8
    static let modalWidth = halfScreenWidth * 1.75
    
}
