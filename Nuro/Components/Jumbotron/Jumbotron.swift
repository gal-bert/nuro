//
//  Jumbotron.swift
//  Nuro
//
//  Created by Gregorius Albert on 05/10/22.
//

import UIKit
import Lottie

class Jumbotron: UIView {
    
    private lazy var animationView: LottieAnimationView = {
        let view = LottieAnimationView()
        return view
    }()
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.frame = CGRect(x: self.frame.width / 2 - 125, y: self.frame.height / 2 - 125, width: 250, height: 250)

        return view
    }()
    
    private lazy var greetingLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.Brand.blueViolet
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 36)
        return view
    }()
    
    private lazy var clockLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.Brand.blueViolet
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 32)
        view.text = "00.00"
        return view
    }()
    
    private lazy var dateLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.Brand.blueViolet
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 32)
        view.text = "Senin, 26 September 2022"
        return view
    }()
    
    
    private lazy var childStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 25
        return view
    }()

    private lazy var parentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 5
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        self.layer.cornerRadius = 20
        backgroundColor = UIColor(patternImage: UIImage(named: "jumbotron-bg")!)
        
//        setupAnimation()
        
//        addSubview(animationView)
        
        addSubview(imageView)
        addSubview(parentStackView)
        addSubview(childStackView)

        childStackView.addArrangedSubview(clockLabel)
        childStackView.addArrangedSubview(dateLabel)
        
        parentStackView.addArrangedSubview(greetingLabel)
        parentStackView.addArrangedSubview(childStackView)
        
        
        TimeframeImageHelper.setImage(imageView: imageView)
        getIndonesianDate()
        getTickingTime()
        
        setupConstraints()
    }
    
    private func setupAnimation() {
        switch Date().getTimeframeId() {
        case 1:
            animationView = .init(name: "OtinJT-Morning")
        case 2:
            animationView = .init(name: "OtinJT-Day")
        case 3:
            animationView = .init(name: "OtinJT-Night")
        default:break
        }
        
        animationView.contentMode = .scaleAspectFill
        animationView.loopMode = .loop
        animationView.layer.cornerRadius = 20
        animationView.alpha = 0.6
        animationView.play()
    }
    
    private func setupConstraints() {
        
//        animationView.snp.makeConstraints { make in
//            make.top.left.right.bottom.equalTo(self)
//        }
        
        imageView.snp.makeConstraints { make in
            make.top.left.bottom.equalTo(self).inset(35)
            make.width.equalTo(imageView.snp.height)
        }
        
        parentStackView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(imageView.snp.right).offset(32)
        }
    }
    
    private func getIndonesianDate() {
        self.dateLabel.text = "\(Date().getLongIndonesianDate())"
    }
    
    private func getTickingTime () {
        /// Initialize tick time to prevent delay from timer
        self.clockLabel.text = "\(Date().getTickingTime())"
        self.greetingLabel.text = "Selamat \(Date().getTimeframe()), \(UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.parentsName)!)!"
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.clockLabel.text = "\(Date().getTickingTime())"
            self.greetingLabel.text = "Selamat \(Date().getTimeframe()), \(UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.parentsName)!)!"
            TimeframeImageHelper.setImage(imageView: self.imageView)
            self.getIndonesianDate()
        }
    }
    
}
