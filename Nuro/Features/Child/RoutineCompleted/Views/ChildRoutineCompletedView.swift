//
//  ChildRoutineCompletedView.swift
//  Nuro
//
//  Created by Karen Natalia on 24/10/22.
//

import UIKit

class ChildRoutineCompletedView: UIView {

    private lazy var pageTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.heavy, size: 64)
        label.text = "Yaayy!"
        label.textAlignment = .center
        label.textColor = Colors.Text.onyx
        return label
    }()
    
    private lazy var routineDoneLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 48)
        label.text = "Semua aktivitas pagimu sudah selesai!"
        label.textAlignment = .center
        label.textColor = Colors.Text.onyx
        return label
    }()
    
    private lazy var instructionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 48)
        label.text = "Kembalikan iPad ini ke Mom"
        label.textAlignment = .center
        label.textColor = Colors.Text.onyx
        return label
    }()
    
    private lazy var appreciationImage = CircleImage(size: ScreenSizes.halfScreenHeight - 80, imageName: Icons.checkmark)
    
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
    
    private lazy var parentModeButton = ParentModeButton(size: 80)
    
    func setup() {
        setupUI()
        setupConstraints()
    }
    
    private func setupUI() {
        backgroundColor = Colors.Neutral.white
        
        addSubview(stackView)
        addSubview(parentModeButton)
        labelStackView.addArrangedSubview(routineDoneLabel)
        labelStackView.addArrangedSubview(instructionLabel)
        stackView.addArrangedSubview(pageTitleLabel)
        stackView.addArrangedSubview(appreciationImage)
        stackView.addArrangedSubview(labelStackView)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(self).inset(64)
        }
        
        appreciationImage.snp.makeConstraints { make in
            make.width.height.equalTo(ScreenSizes.halfScreenHeight - 80)
        }
        
        parentModeButton.snp.makeConstraints { make in
            make.top.left.equalTo(self).inset(64)
            make.width.height.equalTo(80)
        }
    }

}
