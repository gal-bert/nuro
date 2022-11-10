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
        view.tintColor = Colors.Neutral.bronze
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Buat Aktivitas"
        view.textColor = Colors.Neutral.grey
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 20)
        view.textAlignment = .center
        view.numberOfLines = 2
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 8
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
        
        addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.left.right.equalTo(self).inset(8)
            make.centerY.equalTo(self)
        }
        
        imageView.snp.makeConstraints { make in
            make.height.equalTo(self.bounds.width / 2)
            make.width.equalTo(self.bounds.width / 2)
        }
    }
    
}

