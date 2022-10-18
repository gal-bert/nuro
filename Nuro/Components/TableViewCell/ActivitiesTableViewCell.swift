//
//  ActivitiesTableViewCell.swift
//  Nuro
//
//  Created by Samuel Dennis on 17/10/22.
//

import UIKit

class ActivitiesTableViewCell: UITableViewCell {
    
    static let identifier = "activitiesTableViewCell"
    
    private lazy var cellImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = Colors.Brand.blueViolet
// MARK: Uncomment to use inject dummy image
//        view.image = UIImage(named: "dummy")
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 20
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.Text.onyx
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 24)
        view.text = "Rapihkan Kasur"
        return view
    }()
    
    private lazy var descLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.Text.onyx
        view.font = UIFont(name: Fonts.VisbyRoundCF.medium, size: 16)
        view.text = "Kasurmu bersih dan rapi!"
        return view
    }()
    
    private lazy var categoryLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.Text.verseGreen
        view.font = UIFont(name: Fonts.VisbyRoundCF.medium, size: 16)
        view.text = "Kebersihan diri"
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalSpacing
        view.spacing = 20
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
        contentView.addSubview(cellImageView)
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(descLabel)
        stackView.addArrangedSubview(categoryLabel)
    }
    
    private func setupConstraints() {
        cellImageView.snp.makeConstraints { make in
            make.top.left.equalTo(self).inset(15)
            make.width.equalTo(88)
            make.height.equalTo(60)
        }
        
        stackView.snp.makeConstraints { make in
            make.left.equalTo(cellImageView.snp.right).offset(20)
            make.center.equalTo(self)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.backgroundColor = Colors.Brand.floralWhite
        contentView.layer.cornerRadius = 20
        
// MARK: Found weird bug below, uncomment to make cell is having distance
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 0, bottom: 5, right: 0))
        
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = Colors.Brand.jasmine.cgColor
    }
    
}
