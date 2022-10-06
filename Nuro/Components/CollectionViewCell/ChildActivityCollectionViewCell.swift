//
//  ChildActivityCollectionViewCell.swift
//  Nuro
//
//  Created by Karen Natalia on 05/10/22.
//

import UIKit

class ChildActivityCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "childActivityCollectionViewCell"
    
    private lazy var activityImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .systemGray5
        return imageView
    }()
    
    private lazy var labelContainer = UIView()
    
    private lazy var activityNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32)
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        self.layer.cornerRadius = 20
        self.backgroundColor = .systemGray2
        
        self.addSubview(activityImage)
        self.addSubview(labelContainer)
        labelContainer.addSubview(activityNameLabel)
    }
    
    func setupConstraints() {
        activityImage.snp.makeConstraints { make in
            make.left.top.equalTo(self).offset(24)
            make.right.equalTo(self).offset(-24)
            make.height.equalTo(self.bounds.size.height * 3 / 4)
        }
        
        labelContainer.snp.makeConstraints { make in
            make.bottom.equalTo(self.snp.bottom)
            make.left.equalTo(self.snp.left).offset(24)
            make.right.equalTo(self.snp.right).offset(-24)
            make.top.equalTo(activityImage.snp.bottom)
        }
        
        activityNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(labelContainer)
            make.left.right.equalTo(labelContainer)
        }
    }
    
    func setupValue(activityName: String, activityImageName: String) {
        activityImage.image = UIImage(systemName: activityImageName)
        activityNameLabel.text = activityName
    }
    
    func makeHidden() {
        self.alpha = 1
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseIn, animations: { [self] in
            self.alpha = 0
            self.backgroundColor = .clear
            self.activityImage.backgroundColor = .clear
        }, completion: nil)
    }
}
