//
//  ParentActivityListDetailCollectionViewCell.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 19/10/22.
//

import UIKit

class ParentActivityListDetailCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "parentActivityListDetailCollectionViewCell"
    
    func setImage(image: String) {
        imageView.image = UIImage(named: image)
    }
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [Corners.topLeft, Corners.topRight]
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Detail Aktivitas"
        view.textColor = .black
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 22)
        view.textAlignment = .center
//        view.numberOfLines = 2
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
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
        
        titleLabel.textColor = Colors.Text.onyx
        addSubview(imageView)
        addSubview(titleLabel)
        
        imageView.image = UIImage(named: "dummy")
    }
    
    private func setupConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.height.equalTo(120)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.centerX.equalTo(self)
        }
    }
}
