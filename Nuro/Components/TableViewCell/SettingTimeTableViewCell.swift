//
//  SettingTimeTableViewCell.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 03/11/22.
//

import UIKit

class SettingTimeTableViewCell: UITableViewCell {
    
    static let identifier = "settingTimeTableViewCell"
    
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(timePicker)
    }
    
    private func setupConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.left.equalTo(self).offset(15)
            make.centerY.equalTo(self)
        }
        
        timePicker.snp.makeConstraints { make in
            make.right.equalTo(self).inset(15)
            make.centerY.equalTo(self)
        }
    }
}

