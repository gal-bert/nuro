//
//  Environment.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/10/22.
//

import Foundation
import UIKit

/// Put any variables related to the overall application like API endpoints, URLs, etc

enum Environment {
    
    static let appName = "Nuro"
    static let initialVC = UINavigationController(rootViewController: ParentTodayActivityViewController()) // MARK: Setup initial View Controller here
    
}