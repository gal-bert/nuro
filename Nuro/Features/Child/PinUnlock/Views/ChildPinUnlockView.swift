//
//  ChildPinUnlockView.swift
//  Nuro
//
//  Created by Karen Natalia on 27/10/22.
//

import UIKit

protocol ChildPinUnlockViewDelegate {
    func deleteLastPin()
    func dismissPage()
}

class ChildPinUnlockView: UIView {
    
    private lazy var pageTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.heavy, size: 64)
        label.text = "Orang Tua Saja"
        label.textAlignment = .center
        label.textColor = Colors.Text.onyx
        return label
    }()
    
    private lazy var cancelButton: UIButton = {
        let button = UIButton(type: .custom)
        button.configuration = .filled()
        button.setImage(UIImage(systemName: Icons.cancel, withConfiguration: UIImage.SymbolConfiguration(pointSize: 48, weight: UIImage.SymbolWeight.black)), for: .normal)
        button.backgroundColor = Colors.Brand.blueViolet
        button.layer.cornerRadius = 50
        button.clipsToBounds = true
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let cv = UICollectionView(frame: .zero, collectionViewLayout: createFlowLayout())
        cv.isScrollEnabled = false
        cv.backgroundColor = .clear
        return cv
    }()
    
    private lazy var stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 120
        sv.alignment = .center
        return sv
    }()
    
    private lazy var leftStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 16
        sv.alignment = .center
        return sv
    }()
    
    private lazy var pinStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 16
        sv.alignment = .center
        return sv
    }()
    
    private lazy var textField1 = PinTextField()
    private lazy var textField2 = PinTextField()
    private lazy var textField3 = PinTextField()
    private lazy var textField4 = PinTextField()
    private var textFields = [PinTextField]()
    
    private lazy var deletePinButton = DeletePinButton(width: 64, height: 48)
    private lazy var imageView = CircleImage(size: ScreenSizes.screenHeight * 1 / 3 + 48, imageName: Icons.morning)
    
    private lazy var instructionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 32)
        label.text = "Mohon masukkan\ntahun kelahiran Anda:"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.textColor = Colors.Text.onyx
        return label
    }()
    
    private var delegate: ChildPinUnlockViewDelegate?
    
    func setup(vc: ChildPinUnlockViewController) {
        setupCollectionView(vc: vc)
        setupUI()
        setupConstraints()
        setupButton()
        
        delegate = vc
        
        textFields.append(textField1)
        textFields.append(textField2)
        textFields.append(textField3)
        textFields.append(textField4)
    }
    
    private func setupCollectionView(vc: ChildPinUnlockViewController) {
        collectionView.dataSource = vc
        collectionView.delegate = vc
        collectionView.register(PinNumberCollectionViewCell.self, forCellWithReuseIdentifier: PinNumberCollectionViewCell.identifier)
    }
    
    private func setupUI() {
        backgroundColor = Colors.Brand.floralWhite
        
        addSubview(pageTitleLabel)
        addSubview(stackView)
        addSubview(cancelButton)
        stackView.addArrangedSubview(leftStackView)
        stackView.addArrangedSubview(collectionView)
        
        leftStackView.addArrangedSubview(imageView)
        leftStackView.addArrangedSubview(instructionLabel)
        leftStackView.addArrangedSubview(pinStackView)
        
        pinStackView.addArrangedSubview(textField1)
        pinStackView.addArrangedSubview(textField2)
        pinStackView.addArrangedSubview(textField3)
        pinStackView.addArrangedSubview(textField4)
        pinStackView.addArrangedSubview(deletePinButton)
    }
    
    private func setupConstraints() {
        pageTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self).inset(64)
            make.centerX.equalTo(self)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(pageTitleLabel.snp.bottom)
            make.bottom.equalTo(self).inset(64)
            make.centerX.equalTo(self)
        }
        
        collectionView.snp.makeConstraints { make in
            make.width.equalTo(420)
            make.height.equalTo(400 + (ScreenSizes.halfScreenHeight / 24 * 3))
        }
        
        cancelButton.snp.makeConstraints { make in
            make.top.right.equalTo(self).inset(48)
            make.width.height.equalTo(100)
        }
        
        imageView.snp.makeConstraints { make in
            make.width.height.equalTo(ScreenSizes.screenHeight * 1 / 3 + 48)
        }
        
        textField1.snp.makeConstraints { make in
            make.width.height.equalTo(80)
        }
        textField2.snp.makeConstraints { make in
            make.width.height.equalTo(80)
        }
        textField3.snp.makeConstraints { make in
            make.width.height.equalTo(80)
        }
        textField4.snp.makeConstraints { make in
            make.width.height.equalTo(80)
        }
        
        deletePinButton.snp.makeConstraints { make in
            make.height.equalTo(48)
            make.width.equalTo(64)
        }
    }
    
    private func setupButton() {
        deletePinButton.addTarget(self, action: #selector(deleteClicked), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(dismissPage), for: .touchUpInside)
    }
    
    private func createFlowLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.minimumInteritemSpacing = 60
        layout.minimumLineSpacing = ScreenSizes.halfScreenHeight / 24
        return layout
    }
    
    func updatePinTextField(count: Int, newInput: Int) {
        textFields[count - 1].text = "\(newInput)"
    }
    
    func clearTextFields() {
        for textField in textFields {
            textField.text = ""
        }
    }
    
    @objc func deleteClicked() {
        delegate?.deleteLastPin()
    }
    
    @objc func dismissPage() {
        delegate?.dismissPage()
    }
    
    func clearLastPin(count: Int) {
        textFields[count].text = ""
    }
}
