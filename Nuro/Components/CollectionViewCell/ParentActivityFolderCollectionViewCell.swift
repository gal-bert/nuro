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
        imageViewFolder.image = UIImage(named: image)
    }
    
    private lazy var imageViewFolder: UIImageView = {
        let imageView = UIImageView()
//        image.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.layer.borderColor = UIColor.black.cgColor
        imageView.layer.borderWidth = 5
        imageView.layer.cornerRadius = self.frame.size.width/2
        return imageView
    }()
    
    private lazy var titleLabelFolder: UILabel = {
        let view = UILabel()
        view.text = "Judul Aja"
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        view.textAlignment = .center
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
        backgroundColor = .red
        
        addSubview(imageViewFolder)
        addSubview(titleLabelFolder)
        
        imageViewFolder.image = UIImage(named: "image1:1")
    }
    
    private func setupConstraints() {
        
        imageViewFolder.snp.makeConstraints { make in
            make.top.left.right.equalTo(self).inset(15)
            make.height.equalTo(160)
        }
        
        titleLabelFolder.snp.makeConstraints { make in
            make.top.equalTo(imageViewFolder.snp.bottom).offset(15)
            make.left.right.equalTo(self).inset(10)
        }
    }
}

