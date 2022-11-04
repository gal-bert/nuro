//
//  SettingTimeTableViewCell.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 03/11/22.
//

import UIKit

class SettingTimeTableViewCell: UITableViewCell {
    
    static let identifier = "settingTimeTableViewCell"
    
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.backgroundColor = Colors.Background.papayaWhip
        view.axis = .horizontal
        view.distribution = .fillProportionally
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.Text.onyx
        view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 24)
        view.text = "Pagi"
        return view
    }()
    
    lazy var timePicker: UIDatePicker = {
        let view = UIDatePicker()
        view.datePickerMode = .time
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
        stackView.addArrangedSubview(timePicker)
        timePicker.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(timePickerClicked)))
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.left.top.right.bottom.equalTo(self)
        }
    }
    
    @objc private func timePickerClicked() {
        
    }

}

