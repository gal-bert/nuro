//
// Created by Gregorius Albert on 14/11/22.
//

import UIKit

class OnboardingPageControl: UIView {

	lazy var stackView: UIStackView = {
		let view = UIStackView()
		view.axis = .horizontal
		view.distribution = .equalSpacing
		view.alignment = .center
		view.spacing = 8
		return view
	}()

	lazy var skipButton = SkipButton()

	lazy var nextButton = NextButton()

	lazy var pageIndicator: UILabel = {
		let view = UILabel()
		view.text = "1/5"
		view.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 32)
		view.textColor = Colors.Neutral.white
		return view
	}()

	init() {
		super.init(frame: .zero)
		setupView()
		setupConstraints()
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func setupView(){
		addSubview(stackView)
		stackView.addArrangedSubview(skipButton)
		stackView.addArrangedSubview(pageIndicator)
		stackView.addArrangedSubview(nextButton)

		skipButton.addTarget(self, action: #selector(skipAction), for: .touchUpInside)
		nextButton.addTarget(self, action: #selector(nextAction), for: .touchUpInside)
	}

	@objc func skipAction() {
		print("skip")
	}

	@objc func nextAction() {

	}

	func setupConstraints(){
		stackView.snp.makeConstraints { make in
			make.top.left.right.equalToSuperview().inset(20)
		}

		skipButton.snp.makeConstraints { make in
			make.width.equalTo(140)
			make.height.equalTo(64)
		}

		nextButton.snp.makeConstraints { make in
			make.width.equalTo(140)
			make.height.equalTo(64)
		}
	}

}
