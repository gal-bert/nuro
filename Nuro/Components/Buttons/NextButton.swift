//
// Created by Gregorius Albert on 14/11/22.
//

import UIKit

class NextButton: UIButton {

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupButton()
	}

	private func setupButton() {
		backgroundColor = Colors.Neutral.white
		let font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 32)
		let attributedTitle = NSAttributedString(string: "Lanjut", attributes: [NSAttributedString.Key.font: font as Any, NSAttributedString.Key.foregroundColor: Colors.Brand.blueViolet])
		setAttributedTitle(attributedTitle, for: UIControl.State.normal)
		layer.cornerRadius = 20
		layer.cornerCurve = .continuous
		clipsToBounds = true
	}

	override open var isHighlighted: Bool {
		didSet {
			alpha = isHighlighted ? 0.7 : 1.0
		}
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

}
