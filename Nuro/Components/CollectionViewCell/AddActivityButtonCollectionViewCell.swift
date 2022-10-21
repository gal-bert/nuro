//
//  AddActivityButtonCollectionViewCell.swift
//  Nuro
//
//  Created by Gregorius Albert on 20/10/22.
//

import UIKit

class AddActivityButtonCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "addActivityButtonCollectionViewCell"
    
    var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.image = UIImage(systemName: Icons.plus)
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Tambah Aktivitas"
        view.textColor = Colors.Text.seaweed
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 20)
        view.textAlignment = .center
        view.numberOfLines = 2
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
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
        
//        addSubview(stackView)
//        stackView.addArrangedSubview(imageView)
//        stackView.addArrangedSubview(titleLabel)
        addMultipleSubviews(views: imageView, titleLabel)
    }
    
    private func setupConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(self).inset(20)
            make.left.right.equalTo(self).inset(50)
            make.height.equalTo(imageView.snp.width)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.left.right.equalTo(self).inset(10)
        }
        
    }
    
}

