//
//  UIImage+Ext.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 21/10/22.
//

import UIKit

extension UIImage {
    func createImageWithRoundBorder(cornerRadiuos : CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, scale)
        let rect = CGRect(origin:CGPoint(x: 0, y: 0), size: self.size)
        let context = UIGraphicsGetCurrentContext()

        let path = UIBezierPath(
            roundedRect: rect,
            cornerRadius: cornerRadiuos
        )
        context?.beginPath()
        context?.addPath(path.cgPath)
        context?.closePath()
        context?.clip()
        self.draw(at: CGPoint.zero)
        context?.restoreGState()
        path.lineWidth = 1.5
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
