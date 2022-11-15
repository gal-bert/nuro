//
//  GuidedAccessPopOverViewController.swift
//  Nuro
//
//  Created by Samuel Dennis on 13/11/22.
//

import UIKit
import SnapKit

class GuidedAccessPopOverViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Colors.Brand.floralWhite
        
        lazy var pageTitleLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 24)
            label.text = "Guided Access"
            label.textColor = Colors.Brand.blueViolet
            label.textAlignment = .left
            return label
        }()
        
        lazy var instructionLabel: UILabel = {
            let label = UILabel()
            label.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 16)
            label.text = "Izinkan OTIN menyalakan guided access untuk memaksimalkan pengalaman anak menggunakan aplikasi."
            label.textColor = Colors.Brand.blueViolet
            label.textAlignment = .left
            label.numberOfLines = 3
            return label
        }()
        
        lazy var dismissButton = PopoverButton(title: "Buka Pengaturan")
        
        dismissButton.addTarget(self, action: #selector(didTappedDismissButton), for: .touchUpInside)
        
        view.addSubview(pageTitleLabel)
        view.addSubview(instructionLabel)
        view.addSubview(dismissButton)
        
        pageTitleLabel.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview().inset(20)
        }
        
        instructionLabel.snp.makeConstraints { make in
            make.top.equalTo(pageTitleLabel.snp.bottom).offset(20)
            make.left.right.equalTo(pageTitleLabel)
        }
        
        dismissButton.snp.makeConstraints { make in
//            make.top.equalTo(instructionLabel.snp.bottom)
            make.right.bottom.equalToSuperview().inset(20)
            make.width.equalTo(178)
            make.height.equalTo(36)
        }
    }
    
    @objc func didTappedDismissButton() {
        let urlString = "App-prefs:ACCESSIBILITY&path=GUIDED_ACCESS_TITLE"
        let url = URL(string: urlString)!
        UIApplication.shared.open(url)
        
        dismiss(animated: true)
    }


}
