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
        configuration = .filled()
        
        let config = UIImage.SymbolConfiguration(pointSize: 28)
        let image = UIImage(systemName: Icons.parentMode, withConfiguration: config)?.withTintColor(Colors.Brand.jasmine).withRenderingMode(.alwaysOriginal)
        
        setImage(image, for: .normal)
        tintColor = Colors.Brand.floralWhite
        layer.borderColor = Colors.Brand.jasmine.cgColor
        layer.borderWidth = 6
        
        clipsToBounds = true
        layer.cornerRadius = size / 2
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
