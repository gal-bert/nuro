//
//  SettingParentChildTableViewCell.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 04/11/22.
//

import UIKit

class SettingParentChildTableViewCell: UITableViewCell {
    
    static let identifier = "settingParentChildTableViewCell"
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.Text.onyx
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 24)
        view.text = "Orang Tua"
        return view
    }()
    
    lazy var editButton: UIButton = {
        let view = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 24)
        view.setImage(UIImage(systemName: "pencil", withConfiguration: config), for: .normal)
        return view
    }()
    
    lazy var textField: UITextField = {
        let view = UITextField()
        view.backgroundColor = Colors.Brand.floralWhite
        view.layer.borderColor = Colors.Brand.jasmine.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 20
        view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 24)
        view.attributedPlaceholder = NSAttributedString(
            string: "Nama orang tua",
            attributes: [NSAttributedString.Key.foregroundColor: Colors.Neutral.bronze]
        )
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = Colors.Background.papayaWhip
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.layer.cornerRadius = 20
//        view.spacing = 20
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
        addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(textField)
        stackView.addArrangedSubview(editButton)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.left.right.top.bottom.equalTo(self)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(stackView).inset(15)
        }
        
        
    }
    
    @objc private func editButtonClicked() {
        
    }

}


