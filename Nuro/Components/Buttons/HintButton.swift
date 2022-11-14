//
//  HintButton.swift
//  Nuro
//
//  Created by Karen Natalia on 12/11/22.
//

import UIKit

class HintButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tintColor = Colors.Brand.blueViolet
        
        setBackgroundImage(UIImage(systemName: Icons.hint, withConfiguration: UIImage.SymbolConfiguration(pointSize: 32, weight: .bold)), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override open var isHighlighted: Bool {
        didSet {
            self.alpha = isHighlighted ? 0.7 : 1.0
        }
    }

}
