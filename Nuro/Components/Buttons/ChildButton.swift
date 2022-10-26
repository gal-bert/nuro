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
    
    init(title: String, height: CGFloat, type: UIButton.ButtonType = .custom) {
        super.init(frame: .zero)
        
        let font = UIFont(name: Fonts.VisbyRoundCF.heavy, size: 48)
        let attributedTitle = NSAttributedString(string: title, attributes: [NSAttributedString.Key.font: font as Any])
        setAttributedTitle(attributedTitle, for: UIControl.State.normal)
        
        setupButton()
        setupConstraints(height: height)
    }
    
    private func setupButton() {
        clipsToBounds = true
        layer.cornerRadius = 30
        tintColor = Colors.Button.darkBlueGray
        
        var config = UIButton.Configuration.filled()
        config.titlePadding = 12
        config.subtitle = " "
        configuration = config
        
        addSubview(topView)
        topView.isUserInteractionEnabled = false
    }
    
    private func setupConstraints(height: CGFloat) {
        topView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.height.equalTo(height - 20)
        }
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
