//
//  ParentActivityFolderCollectionViewCell.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 10/10/22.
//

import UIKit

class ParentActivityFolderCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "parentActivityListFolderCollectionViewCell"
    
    //    var colorSet : ColorSetModel?
    
//    func setImage(image: String) {
//        emojiImage.image = UIImage(named: image)
//    }
    
    lazy var topFolderView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 12
        view.layer.maskedCorners = [Corners.topLeft, Corners.topRight]
        return view
    }()
    
    lazy var bgView: UIView = {
        let view = UIView()
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
    
    lazy var circleImage = CircleImage(size: 125, imageName: "dummy")
    
    lazy var emojiImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "soapEmoji")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Jenis Aktivitas"
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
        circleImage.backgroundColor = Colors.Neutral.white
//        addSubview(emojiImage)
        addSubview(topFolderView)
        addSubview(bgView)
        bgView.addSubview(stackView)
        stackView.addArrangedSubview(circleImage)
        stackView.addArrangedSubview(titleLabel)
        addSubview(emojiImageView)
//        emojiImage.image = UIImage(named: "soapEmoji")
    }
    
    func setupColorSet(colorSet:ColorSetModel) {
        topFolderView.backgroundColor = colorSet.headerColor
        bgView.backgroundColor = colorSet.backgroundColor
        titleLabel.textColor = colorSet.textColor
    }
    
    private func setupConstraints() {
        
        topFolderView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.right.equalTo(self).inset(20)
            make.height.equalTo(15)
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
        
        emojiImageView.snp.makeConstraints { make in
            make.top.equalTo(self).inset(60)
            make.centerX.equalTo(self)
//            make.width.height.equalTo(100)
        }
    }
}
