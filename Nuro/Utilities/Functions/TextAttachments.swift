//
//  ImageAttachments.swift
//  Nuro
//
//  Created by Gregorius Albert on 11/10/22.
//

import UIKit

class TextAttachments {
    
    static func getAttachment(imageName: String, imageHeight: CGFloat = 30.0, yOffset: CGFloat = -3, colorName: UIColor) -> NSTextAttachment {
        let imageAttachment = NSTextAttachment()
        imageAttachment.image = UIImage(systemName: imageName)?.withTintColor(colorName)
        
        let ratio = imageAttachment.image!.size.width / imageAttachment.image!.size.height
        imageAttachment.bounds = CGRect(x: 5, y: yOffset, width: ratio * imageHeight, height: imageHeight)
        
        return imageAttachment
    }
    
    static func getMulticoloredAttachment(imageName: String, imageHeight: CGFloat = 30.0, yOffset: CGFloat = -3, firstColorName: UIColor, secondColorName: UIColor) -> NSTextAttachment {
        let imageAttachment = NSTextAttachment()
        
        let config = UIImage.SymbolConfiguration(paletteColors: [firstColorName, secondColorName])
        imageAttachment.image = UIImage(systemName: imageName)?.applyingSymbolConfiguration(config)
        
        let ratio = imageAttachment.image!.size.width / imageAttachment.image!.size.height
        imageAttachment.bounds = CGRect(x: 5, y: yOffset, width: ratio * imageHeight, height: imageHeight)
        
        return imageAttachment
    }
    
    static func leadingAttachment(imageName: String, text: String, imageHeight: CGFloat = 30.0, yOffset: CGFloat = -3, colorName: UIColor) -> NSMutableAttributedString {
        
        let imageAttachment = getAttachment(imageName: imageName, imageHeight: imageHeight, yOffset: yOffset, colorName: colorName)
        
        let fullString = NSMutableAttributedString(string: "")
        fullString.append(NSAttributedString(attachment: imageAttachment))
        fullString.append(NSAttributedString(string: "  \(text)"))
        
        return fullString
    }
    
    static func trailingAttachment(text: String, imageName: String, imageHeight: CGFloat = 30.0, yOffset: CGFloat = -3, colorName: UIColor) -> NSMutableAttributedString {
        
        let imageAttachment = getAttachment(imageName: imageName, imageHeight: imageHeight, yOffset: yOffset, colorName: colorName)
        
        let fullString = NSMutableAttributedString(string: "\(text) ")
        fullString.append(NSAttributedString(attachment: imageAttachment))
        
        return fullString
    }
    
    
}
