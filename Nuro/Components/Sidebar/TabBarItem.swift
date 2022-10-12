//
//  TabBarItem.swift
//  Nuro
//
//  Created by Samuel Dennis on 06/10/22.
//

import UIKit

enum TabBarItem: Int, CaseIterable {
    case parentTodayActivity, parentRoutine, parentActivityList, childRoutine
    
    func title() -> String {
        switch self {
        case .parentTodayActivity:
            return Strings.parentTodayActivityTitle
        case .parentRoutine:
            return Strings.parentRoutineTitle
        case .parentActivityList:
            return Strings.parentActivityListTitle
        case .childRoutine:
            return Strings.childRoutineTitle
        }
    }
    
    func image() -> UIImage? {
        switch self {
        case .parentTodayActivity:
            return UIImage(systemName: Icons.checkmark)
        case .parentRoutine:
            return UIImage(systemName: Icons.tornado)
        case .parentActivityList:
            return UIImage(systemName: Icons.listBulletRectanglePortrait)
        case .childRoutine:
            return UIImage(systemName: Icons.aqi)
        }
    }
}
