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
        view.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.layer.borderWidth = 1
        view.layer.cornerRadius = view.frame.height
        view.clipsToBounds = true
        return view
    }()
    
    let clockLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont(name: view.font.fontName, size: 20)
        view.text = "10.50"
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
        backgroundColor = .yellow
        imageView.image = UIImage(named: "dummy")
        addSubview(imageView)
        addSubview(clockLabel)
        setupConstraints()
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(35)
            make.left.equalTo(self).inset(25)
            make.width.equalTo(imageView.snp.height)
        }
        
        clockLabel.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(35)
            make.left.equalTo(<#T##other: ConstraintRelatableTarget##ConstraintRelatableTarget#>)
        }
        
    }
    
}
