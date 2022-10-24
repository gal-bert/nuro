//
//  ChildStarterView.swift
//  Nuro
//
//  Created by Karen Natalia on 24/10/22.
//

import UIKit

class ChildStarterView: UIView {

    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.heavy, size: 64)
        label.text = "Selamat pagi, xxxx!"
        label.textAlignment = .center
        label.textColor = Colors.Text.onyx
        return label
    }()
    
    private lazy var timeImage = CircleImage(size: ScreenSizes.halfScreenHeight - 80, imageName: Icons.morning)
    private lazy var button = ChildButton(title: "Selamat pagi", height: ScreenSizes.halfScreenHeight / 4)
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .equalSpacing
        return sv
    }()
    
    func setup() {
        setupButton()
        setupUI()
        setupConstraints()
    }
    
    private func setupButton() {
        button.addTarget(self, action: #selector(viewRoutine), for: .touchUpInside)
    }
    
    private func setupUI() {
        backgroundColor = Colors.Neutral.white
        
        addSubview(stackView)
        stackView.addArrangedSubview(greetingLabel)
        stackView.addArrangedSubview(timeImage)
        stackView.addArrangedSubview(button)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self).inset(64)
        }
        
        timeImage.snp.makeConstraints { make in
            make.width.height.equalTo(ScreenSizes.halfScreenHeight - 80)
        }
        
        button.snp.makeConstraints { make in
            make.width.equalTo(ScreenSizes.halfScreenWidth)
            make.height.equalTo(ScreenSizes.halfScreenHeight / 4)
        }
    }
    
    @objc func viewRoutine() {
        // TODO: Add segue to child routine view
        // ..
    }
}
