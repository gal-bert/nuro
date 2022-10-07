//
//  ParentActivityCollectionViewCell.swift
//  Nuro
//
//  Created by Gregorius Albert on 06/10/22.
//

import UIKit

class ParentActivityCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "parentActivityCollectionViewCell"
    
    func setImage(image: String) {
        imageView.image = UIImage(named: image)
    }
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        view.layer.borderWidth = 2
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Judul Aktivitas"
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        view.textAlignment = .center
        return view
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let view = UILabel()
        view.text = "Deskripsi aktivitas"
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.textAlignment = .center
        return view
    }()
    
//    let stackView: UIStackView = {
//        let view = UIStackView()
//        view.axis = .vertical
//        view.spacing = 10
//        return view
//    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .gray
        layer.cornerRadius = 20
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        backgroundColor = .red
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(descriptionLabel)
        
        imageView.image = UIImage(named: "dummy")
    }
    
    private func setupConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self).inset(15)
            make.height.equalTo(160)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(15)
            make.left.right.equalTo(self).inset(10)
        }
        
        descriptionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.left.right.equalTo(self).inset(10)
        }
        
    }
    
}
