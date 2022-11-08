//
//  ParentActivityCollectionViewCell.swift
//  Nuro
//
//  Created by Gregorius Albert on 06/10/22.
//

import UIKit

class ParentActivityCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "parentActivityCollectionViewCell"
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [Corners.topLeft, Corners.topRight]
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Judul Aktivitas"
        view.textColor = .black
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 24)
        view.textAlignment = .center
        return view
    }()
    
    lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "Deskripsi aktivitas"
        view.textColor = .black
        view.font = UIFont(name: Fonts.VisbyRoundCF.medium, size: 18)
        view.textAlignment = .center
        return view
    }()
    
    lazy var labelContainer: UIView = {
        let view = UIView()
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = 4
        return sv
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
        descriptionLabel.textColor = titleLabel.textColor
        
        addSubview(imageView)
        addSubview(labelContainer)
        labelContainer.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descriptionLabel)
        
        imageView.image = UIImage(named: "dummy")
    }

    func configure(model: Activity) {
        imageView.image = Document.getImageFromDocument(imageURL: model.activityImageURL)
        titleLabel.text = model.activityName
        descriptionLabel.text = model.activityDesc

    }
    
    private func setupConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.height.equalTo(contentView.frame.height * 2 / 3)
        }
        
        labelContainer.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom)
            make.bottom.left.right.equalTo(self)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalTo(labelContainer)
            make.left.right.equalTo(labelContainer).inset(12)
        }
        
    }
    
}
