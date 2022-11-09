//
// Created by Gregorius Albert on 09/11/22.
//

import UIKit

class TimeframeImageHelper {

	static func setImage(imageView: UIImageView) {
		switch Date().getTimeframeId() {
		case 1:
			imageView.image = UIImage(named: "morning-jumbotron")
		case 2:
			imageView.image = UIImage(named: "afternoon-jumbotron")
		case 3:
			imageView.image = UIImage(named: "evening-jumbotron")
		default:
			imageView.image = UIImage(named: "morning-jumbotron")
		}
	}

}
