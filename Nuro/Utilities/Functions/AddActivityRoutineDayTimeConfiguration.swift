//
//  AddActivityRoutineDayTimeConfiguration.swift
//  Nuro
//
//  Created by Samuel Dennis on 16/11/22.
//

import Foundation
import UIKit

class AddActivityRoutineDayTimeConfiguration {
    static func getAttributedText(grayText: String, text: String) -> NSMutableAttributedString {
        let grayAttribute = [NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.regular, size: 24), NSAttributedString.Key.foregroundColor: UIColor.gray]
        let grayString = NSMutableAttributedString(string: grayText, attributes: grayAttribute as [NSAttributedString.Key : Any])

        let regularAttribute = [NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.regular, size: 24), NSAttributedString.Key.foregroundColor: Colors.Text.onyx]
        let regularString = NSMutableAttributedString(string: text, attributes: regularAttribute as [NSAttributedString.Key : Any])

        let attributedString = NSMutableAttributedString(attributedString: grayString)
        attributedString.append(NSMutableAttributedString(attributedString: regularString))

        return attributedString
    }
}
