//
//  SettingsPath.swift
//  Nuro
//
//  Created by Gregorius Albert on 07/10/22.
//

import Foundation

enum Paths {
    
    static let guidedAccessSettingsPath = "App-prefs:ACCESSIBILITY&path=GUIDED_ACCESS_TITLE"
    static let documentPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    
}
