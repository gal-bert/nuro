//
//  CellEditButton.swift
//  Nuro
//
//  Created by Gregorius Albert on 17/10/22.
//

import UIKit

class CellEditButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    
    private func setupButton() {
        setTitle("Edit", for: .normal)
        clipsToBounds = true
        layer.cornerRadius = 14
        layer.cornerCurve = .continuous
        backgroundColor = Colors.Button.pewterBlue
        setTitleColor(Colors.Neutral.white, for: .normal)
        titleLabel?.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 22)
        titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 4, right: 0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.black : Colors.Button.pewterBlue
        }
    }
    
}
