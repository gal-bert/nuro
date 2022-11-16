//
// Created by Gregorius Albert on 16/11/22.
//

import UIKit
import AVFoundation

class MicroInteractions {

	static var player = AVAudioPlayer()

	static func playSound(){
		let url = Bundle.main.url(forResource: "touch-sound-cut", withExtension: "mp3")
		do{
			player = try AVAudioPlayer(contentsOf: url!)
		} catch {
			print(error.localizedDescription)
		}
		player.play()
	}

	static func shrinkAndGrow(
			button: UIView, scaleX: Double, scaleY: Double,
			duration: Double = 0.1,
			withAudio: Bool = false,
			completion: @escaping () -> Void
	) {

		UIView.animate(withDuration: duration, animations: {
            button.transform = CGAffineTransform(scaleX: scaleX, y: scaleY)
		}, completion: { _ in
			completion()
		})

		if withAudio {
			playSound()
		}

	}

}
