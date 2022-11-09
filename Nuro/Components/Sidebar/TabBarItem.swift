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
            return UIImage(named: Icons.hariIni)?.applyingSymbolConfiguration(UIImage.SymbolConfiguration(weight: .regular))
        case .parentRoutine:
            return UIImage(named: Icons.penjadwalan)
        case .parentActivityList:
            return UIImage(named: Icons.aktivitas)
        case .childRoutine:
            return UIImage(systemName: Icons.aqi)
        case .settingsPage:
            return UIImage(systemName: Icons.gear)
        }
    }
}
