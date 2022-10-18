//
//  Jumbotron.swift
//  Nuro
//
//  Created by Gregorius Albert on 05/10/22.
//

import UIKit

class Jumbotron: UIView {
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var greetingLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.Brand.blueViolet
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 36)
        view.text = "Selamat Pagi Mom!"
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
        imageView.image = UIImage(named: "dummy")
        addSubview(imageView)
        
        addSubview(parentStackView)
        addSubview(childStackView)

        childStackView.addArrangedSubview(clockLabel)
        childStackView.addArrangedSubview(dateLabel)
        
        parentStackView.addArrangedSubview(greetingLabel)
        parentStackView.addArrangedSubview(childStackView)
        
        getIndonesianDate()
        getTickingTime()
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.left.bottom.equalTo(self).inset(35)
            make.width.equalTo(imageView.snp.height)
        }
        
        parentStackView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.left.equalTo(imageView.snp.right).offset(25)
        }
    }
    
    private func getIndonesianDate() {
        self.dateLabel.text = "\(Date().getLongIndonesianDate())"
    }
    
    private func getTickingTime () {
        /// Initialize tick time to prevent delay from timer
        self.clockLabel.text = "\(Date().getTickingTime())"
        
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { timer in
            self.clockLabel.text = "\(Date().getTickingTime())"
        }
    }
    
}
