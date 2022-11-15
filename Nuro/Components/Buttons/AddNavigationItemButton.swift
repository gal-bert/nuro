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
		setTitleColor(.gray, for: .normal)
	}

	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
