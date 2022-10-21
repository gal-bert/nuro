//
//  CoreDataProtocols.swift
//  Nuro
//
//  Created by Karen Natalia on 17/10/22.
//

import UIKit

protocol CategoryRepository {
    func getAll() -> [Category]
    func getCategory(name: String) -> Category
    func addCategory(name: String)
}

protocol ActivityRepository {
    func add(name: String, desc: String, image: UIImage, to category: Category)
    func getActivitiesOfCategory(category: Category) -> [Activity]
    func update(activity: Activity, newName: String, newDesc: String, newImage: UIImage, newCategory: Category)
    func delete(activity: Activity)
}

protocol RoutineHeaderRepository {
    func add(dayID: Int, timeID: Int)
    func getAll() -> [RoutineHeader]
    func getRoutinesOfDay(dayID: Int) -> [RoutineHeader]
    func getRoutineOfDayAndTime(dayID: Int, timeID: Int) -> RoutineHeader
}

protocol RoutineDetailRepository {
    func add(dayID: Int, timeID: Int, activity: Activity)
    func getMaxPosition(routineHeader: RoutineHeader) -> Int16
    func getRoutineDetails(of header: RoutineHeader) -> [RoutineDetail]
    func getRoutineDetails(dayID: Int, timeID: Int) -> [RoutineDetail]
    func updatePosition(routineDetail: RoutineDetail, newPosition: Int)
    func delete(routineDetail: RoutineDetail)
}
