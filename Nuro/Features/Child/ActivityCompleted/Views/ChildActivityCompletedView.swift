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
        label.text = "Kerja bagus, \(UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.kidsName)!)!"
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
    
    private lazy var appreciationImage = CircleImage(size: ScreenSizes.halfScreenHeight - 80, image: UIImage(named: "checklist-circle") ?? UIImage())
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
    
    private var delegate: ChildActivityCompletedDelegate?
    var animationDelegate: ChildRoutineAnimationDelegate?
    
    func setup(vc: ChildActivityCompletedViewController, activityDesc: String) {
        delegate = vc
        
        setupButton()
        setupUI()
        setupConstraints()
        
        activityDescLabel.text = activityDesc
        
        Transition.smoothAnimationWithDelay(view: self, subviews: subviews, bgColor: Colors.Neutral.white, delayForViews: [appreciationImage], delayTime: Transition.DelayTime.slightDelay)
    }
    
    private func setupButton() {
        nextActivityButton.addTarget(self, action: #selector(nextActivity), for: .touchUpInside)
        nextActivityButton.addTarget(self, action: #selector(animateDown), for: .touchDown)
        nextActivityButton.addTarget(self, action: #selector(animateUp), for: .touchUpOutside)
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

    @objc func animateUp(_ sender: UIButton) {
        MicroInteractions.shrinkAndGrow(button: sender, scaleX: 1.0, scaleY: 1.0) {

        }
    }

    @objc func animateDown(_ sender: UIButton) {
        MicroInteractions.shrinkAndGrow(button: sender, scaleX: 0.9, scaleY: 0.9) {

        }
    }
    
    @objc func nextActivity() {

        MicroInteractions.shrinkAndGrow(button: nextActivityButton, scaleX: 1.0, scaleY: 1.0) {
            self.animationDelegate?.triggerAnimation()
            self.delegate?.dismissViewController()
        }

    }
}
