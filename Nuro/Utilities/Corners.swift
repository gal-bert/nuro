//
//  Corners.swift
//  Nuro
//
//  Created by Gregorius Albert on 10/10/22.
//

import Foundation
import QuartzCore

enum Corner {
    static let topLeft  = CACornerMask.layerMinXMinYCorner
    static let topRight = CACornerMask.layerMaxXMinYCorner
    static let bottomLeft = CACornerMask.layerMinXMaxYCorner
    static let bottomRight = CACornerMask.layerMaxXMaxYCorner
}
