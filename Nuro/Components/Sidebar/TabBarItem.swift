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
            return "Aktivitas hari ini"
        case .parentRoutine:
            return "Rutinitas"
        case .parentActivityList:
            return "Daftar aktivitas"
        case .childRoutine:
            return "Rutinitas anak"
        }
    }
    
    func image() -> UIImage? {
        switch self {
        case .parentTodayActivity:
            return UIImage(systemName: "checkmark.square.fill")
        case .parentRoutine:
            return UIImage(systemName: "list.bullet.rectangle.portrait.fill")
        case .parentActivityList:
            return UIImage(systemName: "tornado.circle.fill")
        case .childRoutine:
            return UIImage(systemName: "folder")
        }
    }
}
