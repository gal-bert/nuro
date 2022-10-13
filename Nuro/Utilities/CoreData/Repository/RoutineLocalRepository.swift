//
//  RoutineLocalRepository.swift
//  Nuro
//
//  Created by Karen Natalia on 12/10/22.
//

import Foundation
import CoreData

protocol RoutineRepository {
    func getAll() -> [Routine]
    func add(dayID: Int, timeID: Int, activity: Activity)
    func getNumOfActivities(dayID: Int, timeID: Int) -> Int
    func getRoutineOfDay(dayID: Int) -> [Routine]
    func getRoutineOfDayAndTime(dayID: Int, timeID: Int) -> [Routine]
    func update(routine: Routine, newDayID: Int, newTimeID: Int, newPosition: Int)
    func delete(routine: Routine)
}

class RoutineLocalRepository: RoutineRepository {
    
    static let shared = RoutineLocalRepository()
    
    private let context = CoreDataManager.shared.context
    
    func getAll() -> [Routine] {
        let request: NSFetchRequest = Routine.fetchRequest()
        
        let daySort = NSSortDescriptor(key: "dayID", ascending: true)
        let timeSort = NSSortDescriptor(key: "timeID", ascending: true)
        let positionSort = NSSortDescriptor(key: "position", ascending: true)
        request.sortDescriptors = [daySort, timeSort, positionSort]
        
        guard let routines = try? context.fetch(request) else {
            return []
        }
        
        return routines
    }
    
    func add(dayID: Int, timeID: Int, activity: Activity) {
        let newRoutine = Routine(context: context)
        newRoutine.dayID = Int16(dayID)
        newRoutine.timeID = Int16(timeID)
        newRoutine.activity = activity
        newRoutine.position = Int16(getNumOfActivities(dayID: dayID, timeID: timeID))
        
        do {
            try context.save()
        } catch {
            print("Add new routine failed")
        }
    }
    
    func getNumOfActivities(dayID: Int, timeID: Int) -> Int {
        let routines = getRoutineOfDayAndTime(dayID: dayID, timeID: timeID)
        return routines.count
    }
    
    func getRoutineOfDay(dayID: Int) -> [Routine] {
        let request: NSFetchRequest = Routine.fetchRequest()
        request.predicate = NSPredicate(format: "dayID = %d", dayID)
        
        let timeSort = NSSortDescriptor(key: "timeID", ascending: true)
        let positionSort = NSSortDescriptor(key: "position", ascending: true)
        request.sortDescriptors = [timeSort, positionSort]
        
        guard let routines = try? context.fetch(request) else {
            return []
        }
        
        return routines
    }
    
    func getRoutineOfDayAndTime(dayID: Int, timeID: Int) -> [Routine] {
        let request: NSFetchRequest = Routine.fetchRequest()
        let dayFilter = NSPredicate(format: "dayID = %d", dayID)
        let timeFilter = NSPredicate(format: "timeID = %d", timeID)
        let filterPredicate = NSCompoundPredicate(type: .and, subpredicates: [dayFilter, timeFilter])
        request.predicate = filterPredicate
        request.sortDescriptors = [NSSortDescriptor(key: "position", ascending: true)]
        
        guard let routines = try? context.fetch(request) else {
            return []
        }
        
        return routines
    }
    
    func update(routine: Routine, newDayID: Int, newTimeID: Int, newPosition: Int) {
        routine.dayID = Int16(newDayID)
        routine.timeID = Int16(newTimeID)
        routine.position = Int16(newPosition)
        
        do {
            try context.save()
        } catch {
            print("Update routine failed")
        }
    }
    
    func delete(routine: Routine) {
        context.delete(routine)
        
        do {
            try context.save()
        } catch {
            print("Delete routine failed")
        }
    }
}
