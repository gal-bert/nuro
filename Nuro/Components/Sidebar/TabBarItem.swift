//
//  TabBarItem.swift
//  Nuro
//
//  Created by Samuel Dennis on 06/10/22.
//

import UIKit

enum TabBarItem: Int, CaseIterable {
    case parentTodayActivity, parentRoutine, parentActivityList, childRoutine, settingsPage
    
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
        case .settingsPage:
            return Strings.settingsTitle
        }
    }
    
    func image() -> UIImage? {
        switch self {
        case .parentTodayActivity:
            return UIImage(named: Icons.todayFill)?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(weight: .black))
        case .parentRoutine:
            return UIImage(named: Icons.routinesFill)?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(weight: .black))
        case .parentActivityList:
            return UIImage(named: Icons.activityFill)?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(weight: .black))
        case .childRoutine:
            return UIImage(named: Icons.kidsFill)?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(weight: .black))
        case .settingsPage:
            return UIImage(systemName: Icons.gear)
        }
    }
}
