//
//  ParentRoutineAddActivityView.swift
//  Nuro
//
//  Created by Samuel Dennis on 24/10/22.
//

import UIKit

class ParentRoutineAddActivityView: UIView {
    
    let waktuRutinitasButton = CreateActivityButton(leftTitle: "Waktu Rutinitas", rightTitle: "")
    let hariRutinitasButton = CreateActivityButton(leftTitle: "Hari Rutinitas", rightTitle: "")
    
    var vc: ParentRoutineAddActivityViewController?
    var delegate: ParentRoutineAddActivityDelegate!
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Brand.floralWhite
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 1
        view.layer.borderColor = Colors.Brand.jasmine.cgColor
        return view
    }()
    
    private lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        return view
    }()
    
    lazy var iconChooseImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.tintColor = Colors.Neutral.bronze
        return view
    }()
    
    lazy var selectImageLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.Neutral.bronze
        view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 32)
        view.text = "Pilih Aktivitas"
        return view
    }()
    
    func setup(vc: ParentRoutineAddActivityViewController) {
        backgroundColor = Colors.Neutral.white
        iconChooseImageView.image = UIImage(systemName: Icons.photo)
        
        delegate = vc
        setupNavigationBar(vc: vc)
        
        self.vc = vc
        
        addSubview(containerView)
        containerView.addSubview(stackView)
        stackView.addArrangedSubview(iconChooseImageView)
        stackView.addArrangedSubview(selectImageLabel)
        addSubview(waktuRutinitasButton)
        addSubview(hariRutinitasButton)
        
        containerView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapChooseActivity)))
        waktuRutinitasButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapRoutineTime)))
        hariRutinitasButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didTapRoutineDay)))
        
        setupConstraints()
    }
    
    @objc private func didTapChooseActivity(_ gesture: UITapGestureRecognizer) {
        let dest = AddActivityViewController()
        dest.delegate = vc
        delegate.pushViewController(dest: dest)
    }
    
    @objc private func didTapRoutineTime(_ gesture: UITapGestureRecognizer) {
        // TODO: Push View Controller to Table View of Time Selection
        let dest = AddActivityRoutimeTimeViewController()
        dest.addActivityRoutineTimeView.delegateData = vc
        delegate.pushViewController(dest: dest)
    }

    @objc private func didTapRoutineDay(_ gesture: UITapGestureRecognizer) {
        // TODO: Push View Controller to Table View of Day Selection
        let dest = AddActivityRoutineDayViewController()
        dest.addActivityRoutineDayView.delegateData = vc
        delegate.pushViewController(dest: dest)
    }
    
    func setupNavigationBar(vc: ParentRoutineAddActivityViewController) {
        vc.title = "Tambah Aktivitas"
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Batal", style: .plain, target: self, action: #selector(didCancelButtonClicked))
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Tambah", style: .plain, target: self, action: #selector(didAddButtonClicked))
        vc.navigationItem.leftBarButtonItem?.tintColor = Colors.Brand.blueViolet
        vc.navigationItem.rightBarButtonItem?.tintColor = Colors.Brand.blueViolet
        vc.navigationItem.rightBarButtonItem?.isEnabled = false
    }
    
    @objc func didCancelButtonClicked() {
        delegate.dismissViewController()
    }
    
    @objc func didAddButtonClicked() {
        delegate.saveActivity()
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(ScreenSizes.modalHeight * 0.65)
        }
        stackView.snp.makeConstraints { make in
            make.centerY.equalTo(containerView)
            make.centerX.equalTo(containerView)
        }
        iconChooseImageView.snp.makeConstraints { make in
            make.width.equalTo(ScreenSizes.modalWidth * 0.2)
            make.height.equalTo(ScreenSizes.modalHeight * 0.25)
        }
        waktuRutinitasButton.snp.makeConstraints { make in
            make.top.equalTo(containerView.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(40)
        }
        hariRutinitasButton.snp.makeConstraints { make in
            make.top.equalTo(waktuRutinitasButton.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(40)
        }
    }
    
    func validateEmptyField() {
        if waktuRutinitasButton.rightLabel.text != "" && hariRutinitasButton.rightLabel.text != "" && vc?.activity != nil {
            vc?.navigationItem.rightBarButtonItem?.isEnabled = true
        }
        else {
            vc?.navigationItem.rightBarButtonItem?.isEnabled = false
        }
    }
}
