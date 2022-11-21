//
//  ColorRGBAFraction.swift
//  Nuro
//
//  Created by Gregorius Albert on 13/10/22.
//

import UIKit

class ColorRGBA {
    
    static func fraction(r:Int, g:Int, b:Int, a:Double = 1) -> UIColor {
        
        let red = Double(r) / 255.0
        let green = Double(g) / 255.0
        let blue = Double(b) / 255.0
        let alpha = a
        
        return UIColor(displayP3Red: red, green: green, blue: blue, alpha: alpha)
    }
    
}
