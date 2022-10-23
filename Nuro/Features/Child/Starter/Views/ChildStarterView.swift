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
        label.tintColor = Colors.Text.onyx
        return label
    }()
    
    private lazy var timeImage = CircleImage(size: ScreenSizes.halfScreenHeight - 80, imageName: Icons.morning)
    
    private lazy var viewRoutineButton: UIButton = {
        let button = UIButton(type: .system)
        button.configuration = .filled()
        button.addTarget(self, action: #selector(viewRoutine), for: .touchUpInside)
        button.layer.cornerRadius = 30
        button.clipsToBounds = true
        button.setTitleColor(Colors.Brand.blueViolet, for: .normal)
        
        let font = UIFont(name: Fonts.VisbyRoundCF.heavy, size: 48)
        let attributedTitle = NSAttributedString(string: "Selamat Pagi", attributes: [NSAttributedString.Key.font: font as Any])
        button.setAttributedTitle(attributedTitle, for: UIControl.State.normal)
        
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .equalSpacing
        return sv
    }()
    
    func setup() {
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        backgroundColor = Colors.Neutral.white
        
        addSubview(stackView)
        stackView.addArrangedSubview(greetingLabel)
        stackView.addArrangedSubview(timeImage)
        stackView.addArrangedSubview(viewRoutineButton)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self).inset(80)
        }
        
        timeImage.snp.makeConstraints { make in
            make.width.height.equalTo(ScreenSizes.halfScreenHeight - 80)
        }
        
        viewRoutineButton.snp.makeConstraints { make in
            make.width.equalTo(ScreenSizes.halfScreenWidth)
            make.height.equalTo(120)
        }
    }
    
    @objc func viewRoutine() {
        
    }
}
