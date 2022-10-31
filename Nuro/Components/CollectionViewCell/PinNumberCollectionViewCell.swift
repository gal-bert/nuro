//
//  PinNumberCollectionViewCell.swift
//  Nuro
//
//  Created by Karen Natalia on 27/10/22.
//

import UIKit

class PinNumberCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "pinNumberCollectionViewCell"
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "0"
        view.textColor = Colors.Text.onyx
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 48)
        view.textAlignment = .center
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = Colors.Brand.jasmine
        layer.cornerRadius = 50
        
        contentView.addSubview(titleLabel)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.center.equalTo(self)
        }
    }
    
    override open var isHighlighted: Bool {
        didSet {
            alpha = isHighlighted ? 0.7 : 1.0
        }
    }
    
}
