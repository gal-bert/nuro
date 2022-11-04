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
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var labelContainer: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Text.verseGreen.withAlphaComponent(0.8)
        view.layer.maskedCorners = [Corners.bottomLeft, Corners.bottomRight]
        return view
    }()
    
    private lazy var activityNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.heavy, size: 40)
        label.textAlignment = .center
        label.textColor = Colors.Neutral.white
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
        layer.cornerRadius = 50
        layer.borderColor = Colors.Brand.jasmine.cgColor
        layer.borderWidth = 2
        clipsToBounds = true
        
        contentView.addSubview(activityImage)
        contentView.addSubview(labelContainer)
        labelContainer.addSubview(activityNameLabel)
    }
    
    func setupConstraints() {
        activityImage.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self)
        }
        
        labelContainer.snp.makeConstraints { make in
            make.bottom.left.right.equalTo(self)
            make.height.equalTo(self.bounds.size.height * 1 / 4.5)
        }
        
        activityNameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(labelContainer)
            make.left.right.equalTo(labelContainer)
        }
    }
    
    func configure(model: Activity) {
        activityImage.image = Document.getImageFromDocument(imageURL: model.activityImageURL)
        activityNameLabel.text = model.activityName
    }
    
    func makeHidden() {
        self.alpha = 1
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseIn, animations: { [self] in
            self.alpha = 0
            self.activityImage.alpha = 0
            self.labelContainer.alpha = 0
        }, completion: nil)
    }
}
