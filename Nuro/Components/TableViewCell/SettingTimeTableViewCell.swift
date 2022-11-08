//
//  SettingTimeTableViewCell.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 03/11/22.
//

import UIKit

class SettingTimeTableViewCell: UITableViewCell {
    
    static let identifier = "settingTimeTableViewCell"
    
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = Colors.Background.papayaWhip
        view.axis = .horizontal
//        view.distribution = .equalSpacing
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.Text.onyx
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 24)
        view.text = "Pagi"
        return view
    }()
    
    lazy var timePicker: UIDatePicker = {
        let view = UIDatePicker()
        view.datePickerMode = .time
        view.locale = Locale(identifier: "id")
//        view.backgroundColor = Colors.Button.pewterBlue
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
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(timePicker)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(self)
        }
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(stackView).offset(15)
            make.width.equalTo(150)
        }
        
        timePicker.snp.makeConstraints { make in
            make.left.equalTo(titleLabel.snp.right).offset(35)
            make.width.equalTo(150)
        }
    }
}

