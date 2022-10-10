//
//  Jumbotron.swift
//  Nuro
//
//  Created by Gregorius Albert on 05/10/22.
//

import UIKit

class Jumbotron: UIView {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = view.frame.height
        view.clipsToBounds = true
        return view
    }()
    
    let clockLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 36)
        view.text = "00.00"
        return view
    }()
    
    let dateLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 32)
        view.text = "Senin, 26 September 2022"
        return view
    }()
    
    let stackView: UIStackView = {
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
        backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        imageView.image = UIImage(named: "dummy")
        addSubview(imageView)
        addSubview(stackView)
        stackView.addArrangedSubview(clockLabel)
        stackView.addArrangedSubview(dateLabel)
        
        setupConstraints()
        
        getIndonesianDate()
        getTickingTime()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.left.bottom.equalTo(self).inset(35)
            make.width.equalTo(imageView.snp.height)
        }
        
        stackView.snp.makeConstraints { make in
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
