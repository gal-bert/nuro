//
//  WelcomeViewController.swift
//  Nuro
//
//  Created by Gregorius Albert on 14/11/22.
//

import UIKit

class WelcomeViewController: UIViewController {

    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.alignment = .center
        return view
    }()

    let titleLabel: UILabel = {
        let view = UILabel()
        view.text = "Selamat datang di"
        view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 64)
        view.textColor = Colors.Neutral.white
        view.textAlignment = .center
        return view
    }()

    let imageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "logo-white")
        view.contentMode = .scaleAspectFit
        return view
    }()

    lazy var pageControl = OnboardingPageControl()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = Colors.Brand.blueViolet
        view.addSubview(stackView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(imageView)
        view.addSubview(pageControl)

        pageControl.skipButton.addTarget(self, action: #selector(skipAction), for: .touchUpInside)
        pageControl.nextButton.addTarget(self, action: #selector(nextAction), for: .touchUpInside)

        pageControl.pageIndicator.text = "1/\(Strings.maxOnboardingPage)"

        setupConstraints()
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
        let dest = InputParentsNameViewController()
        dest.modalPresentationStyle = .fullScreen
        Transition.animateTransition(vc: self)
        present(dest, animated: false)
    }

    func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.left.right.equalTo(view.safeAreaLayoutGuide)
            make.bottom.equalTo(pageControl.snp.top)
        }

        imageView.snp.makeConstraints { make in
            make.width.equalTo(ScreenSizes.halfScreenWidth)
        }

        pageControl.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-60)
            make.height.equalTo(64)
            make.left.right.equalTo(view.safeAreaLayoutGuide).inset(40)
        }

    }

}
