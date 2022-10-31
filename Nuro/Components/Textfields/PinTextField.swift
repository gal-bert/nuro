//
//  PinTextField.swift
//  Nuro
//
//  Created by Karen Natalia on 27/10/22.
//

import UIKit

class PinTextField: UITextField {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUnderline(width: 80.0, height: 80.0, lineWidth: 10.0)
        isUserInteractionEnabled = false
        textAlignment = .center
        font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 48)
        textColor = Colors.Text.onyx
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUnderline(width: CGFloat, height: CGFloat, lineWidth: CGFloat) {
        let bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0, y: height - lineWidth, width: width, height: lineWidth)
        bottomLine.cornerRadius = lineWidth / 2
        bottomLine.backgroundColor = Colors.Brand.jasmine.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(bottomLine)
    }

}
