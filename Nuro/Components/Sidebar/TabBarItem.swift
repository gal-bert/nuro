//
//  TabBarItem.swift
//  Nuro
//
//  Created by Samuel Dennis on 06/10/22.
//

import UIKit

enum TabBarItem: Int, CaseIterable {
    case parentTodayActivity, parentActivityList, parentRoutine, collections
    
    func title() -> String {
        switch self {
        case .parentTodayActivity:
            return "Aktivitas Hari Ini"
        case .parentActivityList:
            return "Daftar Aktivitas"
        case .parentRoutine:
            return "Rutinitas"
        case .collections:
            return "Collections"
        }
    }
    
    func image() -> UIImage? {
        switch self {
        case .parentTodayActivity:
            return UIImage(systemName: "checkmark.square.fill")
        case .parentActivityList:
            return UIImage(systemName: "list.bullet.rectangle.portrait.fill")
        case .parentRoutine:
            return UIImage(systemName: "tornado.circle.fill")
        case .collections:
            return UIImage(systemName: "folder")
        }
    }
}
