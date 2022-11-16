//
//  InputKidsNameViewController.swift
//  Nuro
//
//  Created by Gregorius Albert on 14/11/22.
//

import UIKit

class InputKidsNameViewController: UIViewController {

    lazy var stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.alignment = .center
        return view
    }()

    lazy var childStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 5
        return view
    }()

    lazy var subChildStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.alignment = .center
        view.spacing = 15
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo-child")
        view.contentMode = .scaleAspectFit
        return view
    }()

    lazy var titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Masukkan nama anak Anda"
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 64)
        view.textColor = Colors.Neutral.white
        view.textAlignment = .center
        return view
    }()
    
    lazy var subtitleLabel: UILabel = {
        let view = UILabel()
        view.text = "Kami tidak menyimpan data pengguna"
        view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 24)
        view.textColor = Colors.Neutral.white
        view.textAlignment = .center
        return view
    }()
    
    lazy var emptyView: UIView = {
        return UIView()
    }()
    
    lazy var textField: UITextField = {
        let view = UITextField()
        view.backgroundColor = .clear
        view.layer.borderColor = Colors.Brand.jasmine.cgColor
        view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 64)
        view.attributedPlaceholder = NSAttributedString(
            string: "Nama anak anda", attributes: [.font: UIFont(name: Fonts.VisbyRoundCF.regular, size: 64)!]
        )
        view.tintColor = Colors.Neutral.white
        view.textColor = Colors.Neutral.white
        view.textAlignment = .center
        return view
    }()
    
    lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.Neutral.white
        return view
    }()
    
    lazy var noticeLabel: UILabel = {
        let view = UILabel()
        view.text = "(Nama dapat diubah di halaman Pengaturan)"
        view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 24)
        view.textColor = Colors.Neutral.white
        view.textAlignment = .center
        return view
    }()

    lazy var pageControl = OnboardingPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.Brand.blueViolet
        view.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(childStackView)
        stackView.addArrangedSubview(emptyView)
        stackView.addArrangedSubview(subChildStackView)
        
        childStackView.addArrangedSubview(titleLabel)
        childStackView.addArrangedSubview(subtitleLabel)

        subChildStackView.addArrangedSubview(textField)
        subChildStackView.addArrangedSubview(divider)
        subChildStackView.addArrangedSubview(noticeLabel)

        view.addSubview(pageControl)

        pageControl.pageIndicator.text = "3/\(Strings.maxOnboardingPage)"

        pageControl.skipButton.addTarget(self, action: #selector(skipAction), for: .touchUpInside)
        pageControl.nextButton.addTarget(self, action: #selector(nextAction), for: .touchUpInside)

        setupConstraints()

        Transition.smoothAnimationPurple(subviews: view.subviews)
    }

    @objc func skipAction() {
        UserDefaults.standard.set(false, forKey: UserDefaultsHelper.Keys.isFirstTime)
        Seeder.shared.seedAll()
        MirrorData.startMirror()
        let dest = Environment.showDoubleColumnSplitViewController()!
        dest.modalPresentationStyle = .fullScreen
        present(dest, animated: true)
    }

    @objc func nextAction() {

        if textField.text != "" {
            UserDefaults.standard.set(textField.text, forKey: UserDefaultsHelper.Keys.kidsName)
        }

        let dest = InputTimeframeViewController()
        dest.modalPresentationStyle = .fullScreen
        Transition.animateTransition(vc: self)
        present(dest, animated: false)
    }

    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.left.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(pageControl.snp.top).offset(-50)
        }

        imageView.snp.makeConstraints { make in
            make.width.equalTo(ScreenSizes.halfScreenWidth - 250)
            make.height.equalTo(ScreenSizes.quarterScreenHeight)
        }
        
        divider.snp.makeConstraints { make in
            make.width.equalTo(ScreenSizes.screenWidth * 0.75)
            make.height.equalTo(1)
        }

        pageControl.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-60)
            make.height.equalTo(64)
            make.left.right.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        
        emptyView.snp.makeConstraints { make in
            make.height.equalTo(8)
        }

    }

}
