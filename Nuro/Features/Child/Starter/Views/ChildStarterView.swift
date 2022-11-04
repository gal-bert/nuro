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
        label.text = "Selamat \(Date().getTimeframe()), \(Strings.kidsName)!"
        label.textAlignment = .center
        label.textColor = Colors.Text.onyx
        return label
    }()
    
    private lazy var timeImage = CircleImage(size: ScreenSizes.halfScreenHeight - 80, imageName: Icons.morning)
    private lazy var button = ChildButton(title: "Selamat \(Date().getTimeframe())", height: ScreenSizes.halfScreenHeight / 4)
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        sv.distribution = .equalSpacing
        return sv
    }()
    
    private var delegate: ChildStarterDelegate?
    
    private var parentModeButton = ParentModeButton(size: 80)
    
    func setup(vc: ChildStarterViewController) {
        delegate = vc
        setupButton()
        setupUI()
        setupConstraints()
    }
    
    private func setupButton() {
        button.addTarget(self, action: #selector(viewRoutine), for: .touchUpInside)
        parentModeButton.addTarget(self, action: #selector(backToParentsMode), for: .touchUpInside)
    }
    
    private func setupUI() {
        backgroundColor = Colors.Neutral.white
        
        parentModeButton.setImage(UIImage(systemName: Icons.cancel, withConfiguration: UIImage.SymbolConfiguration(pointSize: 28))?.withTintColor(Colors.Brand.jasmine).withRenderingMode(.alwaysOriginal), for: .normal)
        
        addSubview(stackView)
        addSubview(parentModeButton)
        stackView.addArrangedSubview(greetingLabel)
        stackView.addArrangedSubview(timeImage)
        stackView.addArrangedSubview(button)
    }
    
    private func setupConstraints() {
        
        parentModeButton.snp.makeConstraints { make in
            make.top.left.equalTo(self).inset(64)
            make.width.height.equalTo(80)
        }
        
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
        delegate?.toRoutineView()
    }
    
    @objc func backToParentsMode() {
        delegate?.backToParentsMode()
    }
}
