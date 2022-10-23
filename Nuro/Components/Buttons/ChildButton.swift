//
//  ChildButton.swift
//  Nuro
//
//  Created by Karen Natalia on 24/10/22.
//

import UIKit

class ChildButton: UIButton {

    private lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Brand.blueViolet
        view.layer.cornerRadius = 30
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(title: String, type: UIButton.ButtonType = .custom) {
        super.init(frame: .zero)
        
        let font = UIFont(name: Fonts.VisbyRoundCF.heavy, size: 48)
        let attributedTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: font as Any])
        setAttributedTitle(attributedTitle, for: UIControl.State.normal)
        
        setupButton()
        setupConstraints()
    }
    
    private func setupButton() {
        clipsToBounds = true
        layer.cornerRadius = 30
        tintColor = Colors.Text.slateBlue
        addSubview(topView)
        
        var config = UIButton.Configuration.filled()
        config.titlePadding = 16
        config.subtitle = " "
        
        self.configuration = config
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        topView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.height.equalTo(96)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
