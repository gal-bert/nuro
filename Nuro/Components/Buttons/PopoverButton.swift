//
//  PopoverButton.swift
//  Nuro
//
//  Created by Samuel Dennis on 15/11/22.
//

import UIKit

class PopoverButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitle("Button", for: .normal)
    }
    
    init(title: String) {
        super.init(frame: .zero)
        setupButton(title: title)
    }

    private func setupButton(title: String) {
        backgroundColor = Colors.Brand.blueViolet
        let font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 16)
        let attributedTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: font as Any, NSAttributedString.Key.foregroundColor: Colors.Neutral.white])
        setAttributedTitle(attributedTitle, for: UIControl.State.normal)
        layer.cornerRadius = 10
        layer.cornerCurve = .continuous
        clipsToBounds = true
    }

    override open var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.7 : 1.0
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
