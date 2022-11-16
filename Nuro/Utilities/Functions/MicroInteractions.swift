//
// Created by Gregorius Albert on 16/11/22.
//

import UIKit


class MicroInteractions {

	static func shrinkAndGrow(button: UIView, scaleX: Double, scaleY: Double, duration: Double = 0.1, completion: @escaping () -> Void) {

		UIView.animate(withDuration: duration, animations: {
            button.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
		}, completion: { _ in
			completion()
		})

	}

}
