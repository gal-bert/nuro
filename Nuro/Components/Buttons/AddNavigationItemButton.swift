//
// Created by Gregorius Albert on 15/11/22.
//

import UIKit

class AddNavigationItemButton: UIButton {

	override init(frame: CGRect) {
		super.init(frame: frame)
		setupButton()
	}

	private func setupButton() {
		setTitle("Tambah", for: .normal)
        setTitleColor(UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.3), for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 17)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
