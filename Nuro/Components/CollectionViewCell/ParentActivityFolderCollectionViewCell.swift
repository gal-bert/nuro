//
//  ParentActivityFolderCollectionViewCell.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 10/10/22.
//

import UIKit

class ParentActivityFolderCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "parentActivityFolderCollectionViewCell"
    
    private lazy var topFolderView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Brand.jasmine
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [Corners.topLeft, Corners.topRight]
        return view
    }()
    
    private lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Background.papayaWhip
        view.layer.cornerRadius =  20
        view.clipsToBounds = true
        return view
    }()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 20
        return view
    }()
    
    private lazy var circleImage = CircleImage(size: 125, imageName: "dummy")
    
    private lazy var titleLabelFolder: UILabel = {
        let view = UILabel()
        view.text = "Kebersihan Diri"
        view.textColor = .black
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 24)
        view.textAlignment = .center
        view.numberOfLines = 2
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
        addSubview(topFolderView)
        addSubview(bgView)
        bgView.addSubview(stackView)
        stackView.addArrangedSubview(circleImage)
        stackView.addArrangedSubview(titleLabelFolder)
        
//        imageView.image = UIImage(named: "dummy")
    }
    
    private func setupConstraints() {
        
        topFolderView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.right.equalTo(self).inset(32)
            make.height.equalTo(16)
            make.width.equalTo(220)
        }
        
        bgView.snp.makeConstraints { make in
            make.top.equalTo(topFolderView.snp.bottom)
            make.left.right.bottom.equalTo(self)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.right.equalTo(self).inset(8)
        }
        
        circleImage.snp.makeConstraints { make in
            make.width.height.equalTo(125)
        }
    }
}
