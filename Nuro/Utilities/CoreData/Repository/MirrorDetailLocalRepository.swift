//
// Created by Gregorius Albert on 10/11/22.
//

import UIKit
import CoreData

class MirrorDetailLocalRepository {

	static let shared = MirrorDetailLocalRepository()
	private let context = CoreDataManager.shared.context

}
