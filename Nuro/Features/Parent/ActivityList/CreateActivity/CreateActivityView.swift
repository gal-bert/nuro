//
//  CreateActivityView.swift
//  Nuro
//
//  Created by Gregorius Albert on 31/10/22.
//

import UIKit

class CreateActivityView: UIView {
    
    var delegate: CreateActivityDelegate!
    
    private lazy var parentStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    private lazy var topStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.spacing = 10
        view.distribution = .fillEqually
        return view
    }()
    
    private lazy var rightStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 10
        return view
    }()
    
    private lazy var nameTextField: UITextField = {
        let view = UITextField()
        view.backgroundColor = Colors.Brand.floralWhite
        view.layer.borderColor = Colors.Brand.jasmine.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 20
        view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 24)
        view.attributedPlaceholder = NSAttributedString(
            string: "Masukkan nama aktivitas",
            attributes: [NSAttributedString.Key.foregroundColor: Colors.Neutral.bronze]
        )
        return view
    }()
    
    lazy var descTextArea: UITextView = {
        let view = UITextView()
        view.backgroundColor = Colors.Brand.floralWhite
        view.layer.borderColor = Colors.Brand.jasmine.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 20
        view.contentInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 24)
        view.text = "Ketik kalimat reward singkat untuk anak saat menyelesaikan aktivitas..."
        view.textColor = Colors.Neutral.bronze
        return view
    }()
    
    lazy var selectImageSelector = SelectImageSelector()
    lazy var categoryContainer = CreateActivityButton()
    
    func setup(vc: CreateActivityViewController) {
        backgroundColor = .white
        
        delegate = vc
        descTextArea.delegate = vc
        
        addSubview(parentStackView)
        
        
        parentStackView.addArrangedSubview(topStackView)
        parentStackView.addArrangedSubview(categoryContainer)
        
        topStackView.addArrangedSubview(selectImageSelector)
        topStackView.addArrangedSubview(rightStackView)
        rightStackView.addArrangedSubview(nameTextField)
        rightStackView.addArrangedSubview(descTextArea)
        
        let paddingView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        nameTextField.leftView = paddingView
        nameTextField.leftViewMode = .always
        
        selectImageSelector.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapImageSelector)))
        
        setupNavigationBar(vc: vc)
        setupConstraints()
    }
    
    func setupNavigationBar(vc: CreateActivityViewController) {
        vc.title = "Tambah Aktivitas Baru"
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Selesai", style: .plain, target: self, action: #selector(dismissAction))
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Tambah", style: .plain, target: self, action: #selector(saveAction))
    }
    
    @objc func dismissAction() {
        delegate.dismissViewController()
    }
    
    @objc func saveAction() {
        delegate.saveActivity()
    }
    
    @objc func didTapImageSelector() {
        delegate.pushSelectorAlert()
    }
                                                
    
    private func setupConstraints() {
        parentStackView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(safeAreaLayoutGuide).inset(40)
        }
        nameTextField.snp.makeConstraints { make in
            make.height.equalTo(ScreenSizes.modalHeight * 0.3)
        }
    }
    
}