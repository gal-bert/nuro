//
//  ActivitiesTableViewCell.swift
//  Nuro
//
//  Created by Samuel Dennis on 17/10/22.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {
    
    static let identifier = "activitiesTableViewCell"
    
    lazy var cellImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = Colors.Brand.blueViolet
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.Text.onyx
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 24)
        view.text = "Rapihkan Kasur"
        return view
    }()
    
    lazy var descLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.Text.onyx
        view.font = UIFont(name: Fonts.VisbyRoundCF.medium, size: 16)
        view.text = "Kasurmu bersih dan rapi!"
        return view
    }()
    
    lazy var categoryLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.Text.verseGreen
        view.font = UIFont(name: Fonts.VisbyRoundCF.medium, size: 16)
        view.text = "Kebersihan diri"
        view.textAlignment = .right
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.spacing = 20
        return view
    }()
    
    private lazy var wrapperView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Brand.floralWhite
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = Colors.Brand.jasmine.cgColor
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
                
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        contentView.addSubview(wrapperView)
        wrapperView.addSubview(cellImageView)
        wrapperView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descLabel)
    }
    
    func configure(model: Activity) {
        cellImageView.image = Document.getImageFromDocument(imageURL: model.activityImageURL)
        titleLabel.text = model.activityName
        descLabel.text = model.activityDesc
        categoryLabel.text = model.category?.categoryName
    }
    
    private func setupConstraints() {
        wrapperView.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(15)
            make.top.bottom.equalTo(contentView).inset(5)
        }

        cellImageView.snp.makeConstraints { make in
            make.left.equalTo(wrapperView).inset(15)
            make.centerY.equalTo(wrapperView)
            make.width.equalTo(88)
            make.height.equalTo(60)
        }
        
        stackView.snp.makeConstraints { make in
            make.left.equalTo(cellImageView.snp.right).offset(20)
            make.right.equalTo(wrapperView).inset(20)
            make.centerY.equalTo(wrapperView)
        }


    }
 
    
}


