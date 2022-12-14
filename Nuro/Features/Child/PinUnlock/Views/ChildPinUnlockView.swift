//
//  ChildPinUnlockView.swift
//  Nuro
//
//  Created by Karen Natalia on 27/10/22.
//

import UIKit

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
//        button.configuration = .filled()
//        button.setImage(UIImage(systemName: Icons.cancel, withConfiguration: UIImage.SymbolConfiguration(pointSize: 48, weight: UIImage.SymbolWeight.black)), for: .normal)
        button.setImage(UIImage(named: "x-button"), for: .normal)
        button.backgroundColor = Colors.Brand.blueViolet
        button.layer.cornerRadius = 40
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
        sv.spacing = 120
        sv.alignment = .center
        return sv
    }()
    
    lazy var pinStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 16
        sv.alignment = .center
        return sv
    }()
    
    private lazy var textStackView: UIStackView = {
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
    
    private lazy var deletePinButton = DeletePinButton(width: 54, height: 40)
    lazy var hintButton = HintButton()
    
    private lazy var instructionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 32)
        label.text = "Masukkan tahun kelahiran:"
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
        
        Transition.smoothAnimationWithDelay(view: self, subviews: subviews, bgColor: Colors.Brand.floralWhite, delayForViews: getDelayedView(), delayTime: Transition.DelayTime.slightDelay)
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
        
        leftStackView.addArrangedSubview(textStackView)
        leftStackView.addArrangedSubview(pinStackView)
        
        textStackView.addArrangedSubview(instructionLabel)
        textStackView.addArrangedSubview(hintButton)
        
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
            make.top.left.equalTo(self).inset(64)
            make.width.height.equalTo(80)
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
            make.height.equalTo(40)
            make.width.equalTo(54)
        }
    }
    
    private func setupButton() {
        deletePinButton.addTarget(self, action: #selector(deleteClicked), for: .touchUpInside)
        deletePinButton.addTarget(self, action: #selector(animateDown), for: .touchDown)
        deletePinButton.addTarget(self, action: #selector(animateUp), for: .touchUpOutside)

        cancelButton.addTarget(self, action: #selector(dismissPage), for: .touchUpInside)
        cancelButton.addTarget(self, action: #selector(animateDown), for: .touchDown)
        cancelButton.addTarget(self, action: #selector(animateUp), for: .touchUpOutside)


        hintButton.addTarget(self, action: #selector(viewHint), for: .touchUpInside)
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

    @objc func animateDown(_ sender: UIButton) {
        MicroInteractions.shrinkAndGrow(button: sender, scaleX: 0.9, scaleY: 0.9, withAudio: true, completion: {

        })
    }

    @objc func animateUp(_ sender: UIButton) {
        MicroInteractions.shrinkAndGrow(button: sender, scaleX: 1.0, scaleY: 1.0, completion: {

        })
    }
    
    @objc func deleteClicked() {
        MicroInteractions.shrinkAndGrow(button: deletePinButton, scaleX: 1.0, scaleY: 1.0, completion: {
            self.delegate?.deleteLastPin()
        })
    }
    
    @objc func dismissPage() {
        MicroInteractions.shrinkAndGrow(button: cancelButton, scaleX: 1.0, scaleY: 1.0, completion: {
            self.delegate?.dismissPage()
        })
    }
    
    @objc func viewHint() {
        delegate?.showHint()
    }
    
    func clearLastPin(count: Int) {
        textFields[count].text = ""
    }
    
    private func getDelayedView() -> [UIView] {
        return [collectionView]
    }
}
