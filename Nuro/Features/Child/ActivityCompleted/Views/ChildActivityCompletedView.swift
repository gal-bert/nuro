//
//  ChildActivityCompletedView.swift
//  Nuro
//
//  Created by Karen Natalia on 24/10/22.
//

import UIKit

class ChildActivityCompletedView: UIView {

    private lazy var pageTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.heavy, size: 64)
        label.text = "Kerja bagus, xxxx!"
        label.textAlignment = .center
        label.tintColor = Colors.Text.onyx
        return label
    }()
    
    private lazy var activityDescLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 48)
        label.text = "Sekarang kasurmu sudah rapih!"
        label.textAlignment = .center
        label.tintColor = Colors.Text.onyx
        return label
    }()
    
    private lazy var appreciationImage = CircleImage(size: ScreenSizes.halfScreenHeight - 80, imageName: Icons.checkmark)
    
    private lazy var nextActivityButton: UIButton = {
        let button = UIButton(type: .custom)
        button.configuration = .filled()
        button.addTarget(self, action: #selector(nextActivity), for: .touchUpInside)
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        
        let font = UIFont.systemFont(ofSize: 40, weight: .bold)
        let attributedTitle = NSAttributedString(string: "Terima kasih", attributes: [NSAttributedString.Key.font: font])
        button.setAttributedTitle(attributedTitle, for: UIControl.State.normal)
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        sv.alignment = .center
        return sv
    }()
    
    func setup() {
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        backgroundColor = .white
        
        addSubview(pageTitleLabel)
        addSubview(stackView)
        stackView.addArrangedSubview(activityDescLabel)
        stackView.addArrangedSubview(appreciationImage)
        stackView.addArrangedSubview(nextActivityButton)
    }
    
    private func setupConstraints() {
        pageTitleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(self).inset(64)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(pageTitleLabel.snp.bottom)
            make.left.right.bottom.equalTo(self).inset(64)
        }
        
        appreciationImage.snp.makeConstraints { make in
            make.width.height.equalTo(ScreenSizes.halfScreenHeight - 80)
        }
        
        nextActivityButton.snp.makeConstraints { make in
            make.width.equalTo(ScreenSizes.halfScreenWidth)
            make.height.equalTo(ScreenSizes.halfScreenHeight / 4)
        }
    }
    
    @objc func nextActivity() {
        // TODO: Add segue to next activity
        // ..
    }
}
