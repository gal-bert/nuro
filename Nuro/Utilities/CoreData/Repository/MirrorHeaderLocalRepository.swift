//
// Created by Gregorius Albert on 10/11/22.
//

import UIKit
import CoreData

class MirrorHeaderLocalRepository {

	static let shared = MirrorHeaderLocalRepository()
	private let context = CoreDataManager.shared.context

	func add(dayID: Int, timeID: Int) {
		let newRoutineHeader = MirrorHeader(context: context)
		newRoutineHeader.dayID = Int16(dayID)
		newRoutineHeader.timeID = Int16(timeID)

		do {
			try context.save()
		} catch {
			print("Add new mirror header failed")
			print(error.localizedDescription)
		}
	}

	func getAll() -> [MirrorHeader] {
		let request: NSFetchRequest = MirrorHeader.fetchRequest()
		let daySort = NSSortDescriptor(key: "dayID", ascending: true)
		let timeSort = NSSortDescriptor(key: "timeID", ascending: true)
		request.sortDescriptors = [daySort, timeSort]

		guard let routines = try? context.fetch(request) else {
			return []
		}

		return routines
	}

	// Create function to truncate core data in MirrorHeader
	func truncate() {
		let request: NSFetchRequest = MirrorHeader.fetchRequest()
		let deleteRequest = NSBatchDeleteRequest(fetchRequest: request as! NSFetchRequest<NSFetchRequestResult>)
		do {
			try context.execute(deleteRequest)
		} catch {
			print("Truncate mirror header failed")
			print(error.localizedDescription)
		}
	}

}