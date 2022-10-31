//
//  SelectImageSelector.swift
//  Nuro
//
//  Created by Gregorius Albert on 31/10/22.
//

import UIKit
import SnapKit

class SelectImageSelector: UIView {
    
    private lazy var iconView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: Icons.photo)
        view.tintColor = Colors.Neutral.bronze
        return view
    }()
    
    private lazy var label: UILabel = {
        let view = UILabel()
        view.text = "Pilih Gambar Aktivitas"
        view.textColor = Colors.Neutral.bronze
        view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 24)
        view.textAlignment = .center
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        return view
    }()
    
    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
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
        backgroundColor = Colors.Brand.floralWhite
        layer.borderColor = Colors.Brand.jasmine.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 20
        
        addSubview(stackView)
        stackView.addArrangedSubview(iconView)
        stackView.addArrangedSubview(label)
        addSubview(imageView)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self)
            make.height.width.equalTo(self)
        }
        
        iconView.snp.makeConstraints { make in
            make.width.equalTo(ScreenSizes.modalWidth * 0.25)
            make.height.equalTo(ScreenSizes.modalHeight * 0.3)
        }
        
        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(self)
        }
        
    }
    
}


