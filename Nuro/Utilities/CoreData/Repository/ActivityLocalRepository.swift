//
//  ActivityLocalRepository.swift
//  Nuro
//
//  Created by Karen Natalia on 12/10/22.
//

import Foundation
import CoreData
import UIKit

class ActivityLocalRepository: ActivityRepository {
    
    static let shared = ActivityLocalRepository()
    
    private let context = CoreDataManager.shared.context
    
    func add(name: String, desc: String, imageURL: String, to category: Category) {
        let newActivity = Activity(context: context)
        newActivity.activityName = name
        newActivity.activityDesc = desc
        newActivity.category = category
        newActivity.activityImageURL = imageURL
        newActivity.createdAt = Date()
        
        do {
            try context.save()
        } catch {
            print("Add new activity failed")
            print(error.localizedDescription)
        }
    }
    
    func getAllActivities() -> [Activity] {
        let request: NSFetchRequest = Activity.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "createdAt", ascending: true)]
        
        guard let activities = try? context.fetch(request)
        else {
            return []
        }
        
        return activities
    }
    
    func getActivitiesOfCategory(category: Category) -> [Activity] {
        guard var activities = category.activityList?.allObjects as? [Activity] else {
            return []
        }
        
        activities = activities.sorted(by: { first, second in
            return first.createdAt?.compare(second.createdAt ?? Date()) == .orderedAscending
        })
        
        return activities
    }
    
    func update(activity: Activity, newName: String, newDesc: String, newImageURL: String, newCategory: Category) {
        activity.activityName = newName
        activity.activityDesc = newDesc
        activity.category = newCategory
        activity.activityImageURL = newImageURL
        
        do {
            try context.save()
        } catch {
            print("Failed to update activity")
            print(error.localizedDescription)
        }
    }
    
    func delete(activity: Activity) {
        context.delete(activity)
        
        do {
            try context.save()
        } catch {
            print("Failed to delete activity")
            print(error.localizedDescription)
        }
    }
}
