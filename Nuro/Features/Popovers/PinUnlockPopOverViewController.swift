//
//  PinUnlockPopOverViewController.swift
//  Nuro
//
//  Created by Samuel Dennis on 15/11/22.
//

import UIKit
import SnapKit

class PinUnlockPopOverViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Colors.Brand.floralWhite
        
        lazy var pageTitleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 24)
            label.text = "Kata Sandi"
            label.textColor = Colors.Brand.blueViolet
            label.textAlignment = .left
            return label
        }()
        
        lazy var instructionLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 16)
            label.text = "Sistem kata sandi tidak menggunakan tahun kelahiran asli anda."
            label.textColor = Colors.Brand.blueViolet
            label.textAlignment = .left
            label.numberOfLines = 2
            return label
        }()
        
        lazy var dismissButton = PopoverButton(title: "Tutup")
        
        dismissButton.addTarget(self, action: #selector(didTappedDismissButton), for: .touchUpInside)
        
        view.addSubview(pageTitleLabel)
        view.addSubview(instructionLabel)
        view.addSubview(dismissButton)
        
        pageTitleLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(30)
        }
        
        instructionLabel.snp.makeConstraints { make in
            make.top.equalTo(pageTitleLabel.snp.bottom).offset(20)
            make.left.right.equalTo(pageTitleLabel)
        }
        
        dismissButton.snp.makeConstraints { make in
            make.right.bottom.equalToSuperview().inset(10)
            make.width.equalTo(ScreenSizes.screenWidth/10)
            make.height.equalTo(ScreenSizes.screenHeight/25)
        }
    }
    
    @objc func didTappedDismissButton() {
        dismiss(animated: true)
    }
}
