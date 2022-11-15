//
//  GuidedAcessLabelConfiguration.swift
//  Nuro
//
//  Created by Samuel Dennis on 15/11/22.
//

import Foundation
import UIKit

class GuidedAccessLabelConfiguration {
    static func getAttributedText(boldText: String, text: String) -> NSMutableAttributedString {
        let boldAttribute = [NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.bold, size: 22)]
        let boldString = NSMutableAttributedString(string: boldText, attributes: boldAttribute as [NSAttributedString.Key : Any])

        let regularAttribute = [NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.regular, size: 22)]
        let regularString = NSMutableAttributedString(string: " \(text) ", attributes: regularAttribute as [NSAttributedString.Key : Any])

        let attributedString = NSMutableAttributedString(attributedString: boldString)
        attributedString.append(NSMutableAttributedString(attributedString: regularString))

        return attributedString
    }
}

