//
//  ParentActivityFolderCollectionViewCell.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 10/10/22.
//

import UIKit

class ParentActivityFolderCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "parentActivityFolderCollectionViewCell"
    
    func setImage(image: String) {
        imageView.image = UIImage(named: image)
    }
    
    private lazy var topFolderView: UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [Corners.topLeft, Corners.topRight]
        return view
    }()
    
    private lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.layer.cornerRadius =  20
        view.clipsToBounds = true
        return view
    }()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.spacing = 20
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 2
        view.layer.borderColor = Colors.royalPurple?.cgColor
        view.layer.maskedCorners = [Corners.topLeft, Corners.topRight]
        return view
    }()
    
    private lazy var circleImage = CircleImage(size: 125, imageName: "dummy")
    
//    private lazy var circleImageFolder: UIImageView = {
//        let circleImage = CircleImage(size: ScreenSizes.halfScreenWidth, imageName: "image1:1")
//        return circleImage
//    }()
    
    private lazy var titleLabelFolder: UILabel = {
        let view = UILabel()
        view.text = "Judul Aktivitas"
        view.textColor = .black
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 24)
        view.textAlignment = .center
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .gray
        layer.cornerRadius = 20
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
//        backgroundColor = .red
        addSubview(topFolderView)
        addSubview(bgView)
        bgView.addSubview(stackView)
        stackView.addArrangedSubview(circleImage)
//        stackView.addArrangedSubview(backgroundView)
        stackView.addArrangedSubview(titleLabelFolder)
        
        imageView.image = UIImage(named: "dummy")
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
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
        
        circleImage.snp.makeConstraints { make in
            make.width.height.equalTo(125)
        }
//
//        titleLabelFolder.snp.makeConstraints { make in
//            make.top.equalTo(imageView.snp.bottom).offset(22)
//            make.left.right.equalTo(self).inset(31)
//        }
    }
}

