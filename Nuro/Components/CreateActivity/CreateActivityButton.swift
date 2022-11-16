//
//  CreateActivityButton.swift
//  Nuro
//
//  Created by Samuel Dennis on 24/10/22.
//

import UIKit

class CreateActivityButton: UIView {
    lazy var leftLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.Text.onyx
        view.font = UIFont(name: Fonts.VisbyRoundCF.medium, size: 22)
        view.text = "Waktu Rutinitas"
        return view
    }()
    
    lazy var rightLabel: UILabel = {
        let view = UILabel()
        view.attributedText = AddActivityRoutineDayTimeConfiguration.getAttributedText(grayText: "Belum dipilih", text: "")
        return view
    }()
    
    lazy var iconImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.tintColor = Colors.Text.onyx
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .equalCentering
        return view
    }()
    
    init(leftTitle: String, rightTitle: String) {
        super.init(frame: .zero)
        self.leftLabel.text = leftTitle
        self.rightLabel.text = rightTitle
        setup()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        iconImageView.image = UIImage(systemName: Icons.chevronRight)
        
        backgroundColor = Colors.Brand.floralWhite
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = Colors.Brand.jasmine.cgColor
    
        addSubview(stackView)
        stackView.addArrangedSubview(leftLabel)
        stackView.addArrangedSubview(rightLabel)
        addSubview(iconImageView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.left.equalTo(self).inset(30)
            make.right.equalTo(iconImageView.snp.left).offset(-10)
            make.centerY.equalTo(self)
        }
        iconImageView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(20)
            make.width.equalTo(20)
            make.right.equalTo(self.snp.right).inset(20)
        }
    }
}
