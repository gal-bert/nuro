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

}
