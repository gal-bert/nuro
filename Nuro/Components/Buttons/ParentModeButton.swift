//
//  ParentModeButton.swift
//  Nuro
//
//  Created by Karen Natalia on 24/10/22.
//

import UIKit

class ParentModeButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(size: CGFloat, type: UIButton.ButtonType = .custom) {
        super.init(frame: .zero)
        setupButton(size: size)
    }
    
    private func setupButton(size: CGFloat) {
        
        let image = UIImage(named: "parents-mode-button")
        setImage(image, for: .normal)
        
        clipsToBounds = true
        layer.cornerRadius = size / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
