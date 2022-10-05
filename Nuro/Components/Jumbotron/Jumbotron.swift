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
//        view.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
//        view.layer.borderWidth = 1
        view.layer.cornerRadius = view.frame.height
        view.clipsToBounds = true
        return view
    }()
    
    let clockLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 80, weight: .bold)
        view.text = "10.34"
        view.backgroundColor = .red
        return view
    }()
    
    let dateLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 32, weight: .regular)
        view.text = "Senin, 26 September 2022"
        view.backgroundColor = .orange
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
        backgroundColor = .yellow
        imageView.image = UIImage(named: "dummy")
        addSubview(imageView)
        addSubview(clockLabel)
        addSubview(dateLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(35)
            make.left.equalTo(self).inset(25)
            make.width.equalTo(imageView.snp.height)
        }
        
        clockLabel.snp.makeConstraints { make in
            make.top.equalTo(self).inset(20)
            make.left.equalTo(imageView.snp.right).offset(25)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(clockLabel.snp.bottom).offset(20)
            make.left.equalTo(imageView.snp.right).offset(25)
        }
        
    }
    
}
