//
//  Strings.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/10/22.
//

import Foundation

/// Put strings here to support localization in the future?
/// Put strings here for reusables

enum Strings {
    static let parentTodayActivityTitle = "Hari Ini"
    static let parentRoutineTitle = "Penjadwalan"
    static let parentActivityListTitle = "Aktivitas"
    static let childRoutineTitle = "Mode Anak"
    static let settingsTitle = "Pengaturan"
    static let kidsName = UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.kidsName) ?? "Anak"
    static let parentsName = UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.parentsName) ?? "Mom"
    static let emptyDescTextViewPlaceHolder = "Ketik kalimat reward singkat untuk anak saat menyelesaikan aktivitas..."
    
    enum Category {
        static let others = "Lainnya"
    }
}
