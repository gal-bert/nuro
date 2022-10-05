//
//  SelectButton.swift
//  Nuro
//
//  Created by Gregorius Albert on 05/10/22.
//

import UIKit

class SelectButton: UIButton {
    
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
        configuration = .filled()
        layer.cornerRadius = 20
        clipsToBounds = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
