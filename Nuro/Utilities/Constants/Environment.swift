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
//    static let initialVC = showDoubleColumnSplitViewController()  // MARK: Setup initial View Controller here
    static let initialVC = WelcomeViewController()
    static let appTintColor = Colors.Brand.blueViolet
    
}

@available(iOS 14, *)
extension Environment {
    static func showDoubleColumnSplitViewController() -> UISplitViewController? {
        
        let parentTodayActivityViewController = ParentTodayActivityViewController()
        
        let sidebarViewController = SidebarViewController()
        
        let splitViewController = UISplitViewController(style: .doubleColumn)
        splitViewController.primaryBackgroundStyle = .sidebar
        splitViewController.preferredDisplayMode = .twoBesideSecondary
        
        
        splitViewController.setViewController(sidebarViewController, for: .primary)
        splitViewController.setViewController(parentTodayActivityViewController, for: .secondary)
        
        return splitViewController
    }
}
