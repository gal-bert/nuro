//
// Created by Gregorius Albert on 10/11/22.
//

import UIKit
import CoreData

class MirrorDetailLocalRepository {

	static let shared = MirrorDetailLocalRepository()
	private let context = CoreDataManager.shared.context

	private let mirrorHeaderRepo = MirrorHeaderLocalRepository.shared

	func add(timeID: Int, activity: Activity) {
		let mirrorHeader = mirrorHeaderRepo.getAll()[timeID-1]

		let newMirrorDetail = MirrorDetail(context: context)
		newMirrorDetail.mirrorHeader = mirrorHeader
		newMirrorDetail.activity = activity
		newMirrorDetail.position = getMaxPosition(mirrorHeader: mirrorHeader)

		do {
			try context.save()
		} catch {
			print("Add new mirror detail failed")
			print(error.localizedDescription)
		}
	}

	func getMaxPosition(mirrorHeader: MirrorHeader) -> Int16 {
		let mirrorDetails = getMirrorDetails(of: mirrorHeader)
		return mirrorDetails[mirrorDetails.count - 1].position + 1
	}

	func getMirrorDetails(of header: MirrorHeader) -> [MirrorDetail] {
		guard var mirrorDetails = header.mirrorDetails?.allObjects as? [MirrorDetail] else {
			return []
		}

		mirrorDetails = mirrorDetails.sorted(by: { first, second in
			return first.position < second.position
		})

		return mirrorDetails
	}

	func getMirrorDetails(timeID: Int) -> [MirrorDetail] {
		let mirrorHeader = mirrorHeaderRepo.getAll()[timeID-1]
		guard var mirrorDetails = mirrorHeader.mirrorDetails?.allObjects as? [MirrorDetail] else {
			return []
		}

		mirrorDetails = mirrorDetails.sorted(by: { first, second in
			return first.position < second.position
		})

		return mirrorDetails
	}

	func updatePosition(mirrorDetail: MirrorDetail, newPosition: Int) {
		mirrorDetail.position = Int16(newPosition)

		do {
			try context.save()
		} catch {
			print("Failed to update mirror detail position")
			print(error.localizedDescription)
		}
	}

	func delete(mirrorDetail: MirrorDetail) {
		context.delete(mirrorDetail)
		do {
			try context.save()
		} catch {
			print("Failed to delete mirror detail")
			print(error.localizedDescription)
		}
	}

}
