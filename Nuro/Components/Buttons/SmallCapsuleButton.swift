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
        setTitleColor(Colors.Neutral.white, for: .normal)
        configuration = .plain()
        clipsToBounds = true
        layer.cornerRadius = 17
        layer.cornerCurve = .continuous
        backgroundColor = Colors.Brand.blueViolet
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
