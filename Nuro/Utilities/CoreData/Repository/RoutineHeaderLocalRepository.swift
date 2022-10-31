//
//  RoutineHeaderLocalRepository.swift
//  Nuro
//
//  Created by Karen Natalia on 13/10/22.
//

import Foundation
import CoreData

class RoutineHeaderLocalRepository: RoutineHeaderRepository {
    
    static let shared = RoutineHeaderLocalRepository()
    
    private let context = CoreDataManager.shared.context
    
    func add(dayID: Int, timeID: Int) {
        let newRoutineHeader = RoutineHeader(context: context)
        newRoutineHeader.dayID = Int16(dayID)
        newRoutineHeader.timeID = Int16(timeID)
        
        do {
            try context.save()
        } catch {
            print("Add new routine header failed")
            print(error.localizedDescription)
        }
    }
    
    func getAll() -> [RoutineHeader] {
        let request: NSFetchRequest = RoutineHeader.fetchRequest()
        let daySort = NSSortDescriptor(key: "dayID", ascending: true)
        let timeSort = NSSortDescriptor(key: "timeID", ascending: true)
        request.sortDescriptors = [daySort, timeSort]
        
        guard let routines = try? context.fetch(request) else {
            return []
        }
        
        return routines
    }
    
    func getRoutinesOfDay(dayID: Int) -> [RoutineHeader] {
        let request: NSFetchRequest = RoutineHeader.fetchRequest()
        request.predicate = NSPredicate(format: "dayID = %d", dayID)
        request.sortDescriptors = [NSSortDescriptor(key: "timeID", ascending: true)]
        
        guard let routines = try? context.fetch(request) else {
            return []
        }
        
        return routines
    }
    
    func getRoutineOfDayAndTime(dayID: Int, timeID: Int) -> RoutineHeader {
        let request: NSFetchRequest = RoutineHeader.fetchRequest()
        let dayFilter = NSPredicate(format: "dayID = %d", dayID)
        let timeFilter = NSPredicate(format: "timeID = %d", timeID)
        let filterPredicate = NSCompoundPredicate(type: .and, subpredicates: [dayFilter, timeFilter])
        request.predicate = filterPredicate
        
        guard let routines = try? context.fetch(request) else {
            return RoutineHeader()
        }
        
        return routines[0]
    }
}
