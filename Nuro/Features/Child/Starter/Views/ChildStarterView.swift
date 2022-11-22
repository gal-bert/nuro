//
//  ChildStarterView.swift
//  Nuro
//
//  Created by Karen Natalia on 24/10/22.
//

import UIKit
import Lottie

class ChildStarterView: UIView {
    
    private lazy var animationView: LottieAnimationView = {
        let view = LottieAnimationView()
        return view
    }()

    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.heavy, size: 64)
        label.text = "Selamat \(Date().getTimeframe())\n\(UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.kidsName)!)!"
        label.textAlignment = .center
        label.textColor = Colors.Text.onyx
        label.numberOfLines = 2
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
        setupAnimation()
        setupButton()
        setupUI()
        setupConstraints()
    }
    
    private func setupButton() {
        button.addTarget(self, action: #selector(viewRoutine), for: .touchUpInside)
        button.addTarget(self, action: #selector(animateDown), for: .touchDown)
        button.addTarget(self, action: #selector(animateUp), for: .touchUpOutside)

        parentModeButton.addTarget(self, action: #selector(backToParentsMode), for: .touchUpInside)
        parentModeButton.addTarget(self, action: #selector(animateDown), for: .touchDown)
        parentModeButton.addTarget(self, action: #selector(animateUp), for: .touchUpOutside)
    }
    
    private func setupUI() {
        backgroundColor = Colors.Neutral.white
        
        parentModeButton.setImage(UIImage(named: "x-button"), for: .normal)
        
        addSubview(stackView)
        addSubview(parentModeButton)
        stackView.addArrangedSubview(greetingLabel)
        stackView.addArrangedSubview(animationView)
        stackView.addArrangedSubview(button)

        TimeframeImageHelper.setImage(imageView: timeImage)

    }
    
    private func setupAnimation() {
        switch Date().getTimeframeId() {
        case 1:
            animationView = .init(name: "OtinJT-Morning-Crop")
        case 2:
            animationView = .init(name: "OtinJT-Day-Crop")
        case 3:
            animationView = .init(name: "OtinJT-Night-Crop")
        default: break
            
        }
        
        animationView.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        
        animationView.play()
    }
    
    private func setupConstraints() {
        
        animationView.snp.makeConstraints { make in
            make.left.right.equalTo(stackView).inset(40)
        }
        
        parentModeButton.snp.makeConstraints { make in
            make.top.left.equalTo(self).inset(64)
            make.width.height.equalTo(80)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(64)
            make.left.equalTo(parentModeButton.snp.right)
            make.right.equalTo(self).offset(-64 - 80)
        }
        
        timeImage.snp.makeConstraints { make in
            make.width.height.equalTo(ScreenSizes.halfScreenHeight - 80)
        }
        
        button.snp.makeConstraints { make in
            make.width.equalTo(ScreenSizes.halfScreenWidth)
            make.height.equalTo(ScreenSizes.halfScreenHeight / 4)
        }
    }

    @objc func animateDown(_ sender: UIButton) {
        MicroInteractions.shrinkAndGrow(button: sender, scaleX: 0.9, scaleY: 0.9, withAudio: true, completion: {

        })
    }

    @objc func animateUp(_ sender: UIButton) {
        MicroInteractions.shrinkAndGrow(button: sender, scaleX: 1.0, scaleY: 1.0, completion: {

        })
    }
    
    @objc func viewRoutine() {
        MicroInteractions.shrinkAndGrow(button: button, scaleX: 1.0, scaleY: 1.0, completion: {
            self.delegate?.toRoutineView()
        })
    }
    
    @objc func backToParentsMode() {
        MicroInteractions.shrinkAndGrow(button: button, scaleX: 1.0, scaleY: 1.0, completion: {
            self.delegate?.backToParentsMode()
        })
    }
}
