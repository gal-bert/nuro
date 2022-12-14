//
//  RoutineDetailLocalRepository.swift
//  Nuro
//
//  Created by Karen Natalia on 13/10/22.
//

import Foundation
import CoreData

class RoutineDetailLocalRepository: RoutineDetailRepository {

    static let shared = RoutineDetailLocalRepository()

    private let context = CoreDataManager.shared.context
    private let routineHeaderRepo = RoutineHeaderLocalRepository.shared

    func add(dayID: Int, timeID: Int, activity: Activity) {
        let routineHeader = routineHeaderRepo.getRoutineOfDayAndTime(dayID: dayID, timeID: timeID)

        let newRoutineDetail = RoutineDetail(context: context)
        newRoutineDetail.routineHeader = routineHeader
        newRoutineDetail.activity = activity
        newRoutineDetail.position = getMaxPosition(routineHeader: routineHeader)

        do {
            try context.save()
        } catch {
            print("Add new routine detail failed")
            print(error.localizedDescription)
        }
    }

    func getMaxPosition(routineHeader: RoutineHeader) -> Int16 {
        let routineDetails = getRoutineDetails(of: routineHeader)
        return routineDetails[routineDetails.count - 1].position + 1
    }

    func getRoutineDetails(of header: RoutineHeader) -> [RoutineDetail] {
        guard var routineDetails = header.routineDetails?.allObjects as? [RoutineDetail] else {
            return []
        }

        routineDetails = routineDetails.sorted(by: { first, second in
            return first.position < second.position
        })

        return routineDetails
    }

    func getRoutineDetails(dayID: Int, timeID: Int) -> [RoutineDetail] {
        let routineHeader = routineHeaderRepo.getRoutineOfDayAndTime(dayID: dayID, timeID: timeID)
        guard var routineDetails = routineHeader.routineDetails?.allObjects as? [RoutineDetail] else {
            return []
        }

        routineDetails = routineDetails.sorted(by: { first, second in
            return first.position < second.position
        })

        return routineDetails
    }

    func updatePosition(routineDetail: RoutineDetail, newPosition: Int, routineHeader: RoutineHeader) {
        routineDetail.position = Int16(newPosition)
        routineDetail.routineHeader = routineHeader

        do {
            try context.save()
        } catch {
            print("Failed to update routine detail position")
            print(error.localizedDescription)
        }
    }

    func updatePosition(routineDetail: RoutineDetail, newPosition: Int) {
        routineDetail.position = Int16(newPosition)

        do {
            try context.save()
        } catch {
            print("Failed to update routine detail position")
            print(error.localizedDescription)
        }
    }

    func delete(routineDetail: RoutineDetail) {
        context.delete(routineDetail)
        do {
            try context.save()
        } catch {
            print("Failed to delete routine detail")
            print(error.localizedDescription)
        }
    }
}

