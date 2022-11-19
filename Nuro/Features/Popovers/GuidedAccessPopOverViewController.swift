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
        
        lazy var dismissButton = PopoverButton()
        
        if UserDefaults.standard.bool(forKey: UserDefaultsHelper.Keys.isGuidedAccessEnabled) {
            pageTitleLabel.text = "Guided Access - Aktif"
            instructionLabel.text = "Guided access untuk memaksimalkan pengalaman anak menggunakan aplikasi sudah aktif"
            dismissButton = PopoverButton(title: "Baik")
            dismissButton.addTarget(self, action: #selector(didTappedDismissButton), for: .touchUpInside)
            
        } else {
            pageTitleLabel.text = "Guided Access - Tidak Aktif"
            instructionLabel.text = "Izinkan OTIN menyalakan guided access untuk memaksimalkan pengalaman anak menggunakan aplikasi."
            dismissButton = PopoverButton(title: "Buka Pengaturan")
            dismissButton.addTarget(self, action: #selector(didTappedOpenSettingsButton), for: .touchUpInside)
        }

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
        
        NotificationCenter.default.addObserver(
            forName: UIAccessibility.guidedAccessStatusDidChangeNotification,
            object: nil,
            queue: OperationQueue.main) { _ in
                if UIAccessibility.isGuidedAccessEnabled {
                    UserDefaults.standard.set(true, forKey: UserDefaultsHelper.Keys.isGuidedAccessEnabled)
                    pageTitleLabel.text = "Guided Access - Aktif"
                    instructionLabel.text = "Guided access untuk memaksimalkan pengalaman anak menggunakan aplikasi sudah aktif"
                    let font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 16)
                    dismissButton.setAttributedTitle(NSAttributedString(string: "Baik", attributes: [NSAttributedString.Key.font: font as Any, NSAttributedString.Key.foregroundColor: Colors.Neutral.white]), for: .normal)
                    dismissButton.addTarget(self, action: #selector(self.didTappedDismissButton), for: .touchUpInside)
                } else {
                    UserDefaults.standard.set(false, forKey: UserDefaultsHelper.Keys.isGuidedAccessEnabled)
                    pageTitleLabel.text = "Guided Access - Tidak Aktif"
                    instructionLabel.text = "Izinkan OTIN menyalakan guided access untuk memaksimalkan pengalaman anak menggunakan aplikasi."
                    let font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 16)
                    dismissButton.setAttributedTitle(NSAttributedString(string: "Buka Pengaturan", attributes: [NSAttributedString.Key.font: font as Any, NSAttributedString.Key.foregroundColor: Colors.Neutral.white]), for: .normal)
                    dismissButton.addTarget(self, action: #selector(self.didTappedOpenSettingsButton), for: .touchUpInside)
                }
            }
    }
    
    @objc func didTappedDismissButton() {
        dismiss(animated: true)
    }
    
    @objc func didTappedOpenSettingsButton() {
        let urlString = "App-prefs:ACCESSIBILITY&path=GUIDED_ACCESS_TITLE"
        let url = URL(string: urlString)!
        UIApplication.shared.open(url)
        
        dismiss(animated: true)
    }


}
