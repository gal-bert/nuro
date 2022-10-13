//
//  ColorRGBAFraction.swift
//  Nuro
//
//  Created by Gregorius Albert on 13/10/22.
//

import UIKit

class ColorRGBA {
    
    static func fraction(r:Int, g:Int, b:Int, a:Int = 1) -> UIColor {
        return UIColor(displayP3Red: CGFloat(r/255), green: CGFloat(g/255), blue: CGFloat(b/255), alpha: CGFloat(a))
    }
    
}
