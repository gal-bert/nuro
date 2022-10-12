//
//  MoreButton.swift
//  Nuro
//
//  Created by Gregorius Albert on 05/10/22.
//

import UIKit

class AddButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        let config = UIImage.SymbolConfiguration(pointSize: 30)
        self.setImage(UIImage(systemName: Icons.plus, withConfiguration: config), for: .normal)
        tintColor = Colors.royalPurple
    }
    
    init(title: String) {
        super.init(frame: .zero)
        self.setTitle(title, for: .normal)
        setupButton()
    }
    
    private func setupButton() {
        configuration = .plain()
        clipsToBounds = true
        layer.cornerRadius = 17
        layer.cornerCurve = .continuous
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
