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
    
    private lazy var bgView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Brand.floralWhite
        view.layer.cornerRadius =  20
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Detail Aktivitas"
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
        addSubview(bgView)
        addSubview(titleLabel)
        
    }
    
    private func setupConstraints() {
        
        
    }
}
