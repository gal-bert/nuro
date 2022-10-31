//
//  AddActivityCollectionViewCell.swift
//  Nuro
//
//  Created by Gregorius Albert on 20/10/22.
//

import UIKit

class AddActivityContentCollectionViewCell: UICollectionViewCell {
    static let identifier = "addActivityContentCollectionViewCell"

    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [Corners.topLeft, Corners.topRight]
        view.image = UIImage(named: "dummy")
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Sepak Bola"
        view.textColor = .black
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 20)
        view.textAlignment = .center
        view.numberOfLines = 2
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        layer.cornerRadius = 20
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        backgroundColor = Colors.Brand.floralWhite
        layer.borderColor = Colors.Brand.jasmine.cgColor
        layer.borderWidth = 1
        
        titleLabel.textColor = Colors.Text.seaweed
        addMultipleSubviews(views: imageView, titleLabel)
        
    }
    
    private func setupConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.height.equalTo(contentView.frame.height * 2 / 3)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(15)
            make.left.right.equalTo(self).inset(10)
            make.bottom.equalTo(self).inset(15)
        }
        
    }
    
}
