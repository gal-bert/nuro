//
//  UIView+Ext.swift
//  Nuro
//
//  Created by Gregorius Albert on 18/10/22.
//

import UIKit

extension UIView {
    func addMultipleSubviews(views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
    
    func createDownArrowShape(width: Int, height: Int) {
        let path = CGMutablePath()
        
        let point1 = CGPoint(x: 0, y: 0)
        let point2 = CGPoint(x: width, y: 0)
        let point3 = CGPoint(x: width/2, y: height)
        
        path.move(to: point3)
        path.addArc(tangent1End: point1, tangent2End: point2, radius: 0)
        path.addArc(tangent1End: point2, tangent2End: point3, radius: 0)
        path.addArc(tangent1End: point3, tangent2End: point1, radius: 4)
        path.closeSubpath()
        
        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = Colors.Brand.blueViolet.cgColor
        
        self.layer.addSublayer(shape)
    }
    
}
