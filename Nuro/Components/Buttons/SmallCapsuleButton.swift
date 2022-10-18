//
//  SelectButton.swift
//  Nuro
//
//  Created by Gregorius Albert on 05/10/22.
//

import UIKit

class SmallCapsuleButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle("Button", for: .normal)
        setupButton()
    }
    
    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        setupButton()
    }
    
    private func setupButton() {
        clipsToBounds = true
        layer.cornerRadius = 17
        layer.cornerCurve = .continuous

        setTitleColor(Colors.Neutral.white, for: .normal)
        backgroundColor = Colors.Brand.blueViolet
        frame.size.width = 60
    }
    
    override open var isHighlighted: Bool {
        didSet {
            backgroundColor = isHighlighted ? UIColor.black : Colors.Brand.blueViolet
            setTitleColor(Colors.Neutral.white, for: .normal)
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
