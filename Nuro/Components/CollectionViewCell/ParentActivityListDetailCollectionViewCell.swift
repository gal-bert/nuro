//
//  ParentActivityListDetailCollectionViewCell.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 19/10/22.
//

import UIKit

protocol DeleteDataCollectionProtocol {
    func deleteData(indx: Int)
}

class ParentActivityListDetailCollectionViewCell: UICollectionViewCell {
    
    var delegate: DeleteDataCollectionProtocol?
    var index: IndexPath?
    
    static let identifier = "parentActivityListDetailCollectionViewCell"
    
    func setImage(image: String) {
        imageView.image = UIImage(named: image)
    }
    
    var isEditing: Bool = false {
        didSet {
            deleteButton.isHidden = !isEditing
        }
    }
    
    lazy var deleteButton: UIButton = {
        let view = UIButton()
        let config = UIImage.SymbolConfiguration(pointSize: 40)
        view.setImage(UIImage(systemName: "minus.circle.fill", withConfiguration: config), for: .normal)
        view.tintColor = .red
        view.backgroundColor = .white
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 25
        view.isHidden = !isEditing
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.maskedCorners = [Corners.topLeft, Corners.topRight]
        return view
    }()
    
    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Detail Aktivitas"
        view.textColor = Colors.Text.onyx
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 22)
        view.textAlignment = .center
        view.numberOfLines = 2
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        layer.cornerRadius = 20
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        
        backgroundColor = Colors.Brand.floralWhite
        layer.borderColor = Colors.Brand.jasmine.cgColor
        layer.borderWidth = 1
        
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(deleteButton)
        
        deleteButton.addTarget(self, action: #selector(deleteButtonAction), for: .touchUpInside)
    }
    
    private func setupConstraints() {
        
        imageView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self)
            make.height.equalTo(140)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(30)
            make.left.right.equalTo(self).inset(10)
        }
        
        deleteButton.snp.makeConstraints { make in
            make.top.left.equalTo(self).inset(3)
        }
    }
    
    @objc private func deleteButtonAction() {
        delegate?.deleteData(indx: (index?.row)!)
    }
}
