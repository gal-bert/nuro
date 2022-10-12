//
//  MoreButton.swift
//  Nuro
//
//  Created by Gregorius Albert on 05/10/22.
//

import UIKit

class MoreButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let config = UIImage.SymbolConfiguration(pointSize: 36)
        self.setImage(UIImage(systemName: Icons.ELLIPSIS, withConfiguration: config), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
