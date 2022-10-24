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
        label.textColor = Colors.Text.onyx
        return label
    }()
    
    private lazy var activityDescLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 48)
        label.text = "Sekarang kasurmu sudah rapih!"
        label.textAlignment = .center
        label.textColor = Colors.Text.onyx
        return label
    }()
    
    private lazy var appreciationImage = CircleImage(size: ScreenSizes.halfScreenHeight - 80, imageName: Icons.checkmark)
    private lazy var nextActivityButton = ChildButton(title: "Terima kasih", height: ScreenSizes.halfScreenHeight / 4)
    
    private lazy var labelStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        return sv
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution = .equalSpacing
        sv.alignment = .center
        return sv
    }()
    
    func setup() {
        setupButton()
        setupUI()
        setupConstraints()
    }
    
    private func setupButton() {
        nextActivityButton.addTarget(self, action: #selector(nextActivity), for: .touchUpInside)
    }
    
    private func setupUI() {
        backgroundColor = Colors.Neutral.white
        
        addSubview(stackView)
        labelStackView.addArrangedSubview(pageTitleLabel)
        labelStackView.addArrangedSubview(activityDescLabel)
        stackView.addArrangedSubview(labelStackView)
        stackView.addArrangedSubview(appreciationImage)
        stackView.addArrangedSubview(nextActivityButton)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self).inset(64)
        }
        stackView.setCustomSpacing(1, after: activityDescLabel)
        
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
