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
        view.backgroundColor = .clear
        view.layer.borderColor = Colors.Brand.jasmine.cgColor
        view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 24)
        view.attributedPlaceholder = NSAttributedString(
            string: "Masukkan nama aktivitas", attributes: [.font: UIFont(name: Fonts.VisbyRoundCF.regular, size: 24)!, .foregroundColor: Colors.Text.onyx]
            
        )
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
        backgroundColor = Colors.Background.papayaWhip
        addSubview(titleLabel)
        addSubview(textField)
        contentView.addSubview(editButton)
        editButton.addTarget(self, action: #selector(editButtonClicked), for: .touchUpInside)
    }
    
    private func setupConstraints() {
//        stackView.snp.makeConstraints { make in
//            make.left.top.bottom.equalTo(self)
//            make.right.equalTo(self).offset(20)
//        }
        
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(self).inset(15)
            make.centerY.equalTo(self)
            make.width.equalTo(150)
        }
        
        textField.snp.makeConstraints { make in
            make.right.equalTo(editButton.snp.left).inset(-25)
            make.centerY.equalTo(self)
            make.width.equalTo(300)
        }
        
        editButton.snp.makeConstraints { make in
            make.right.equalTo(self).inset(15)
            make.centerY.equalTo(self)
            make.width.equalTo(30)
        }
        
        
        
        
        
        
    }
    
    @objc private func editButtonClicked() {
        textField.becomeFirstResponder()
    }

}


