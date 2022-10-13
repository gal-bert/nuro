//
//  ActivityLocalRepository.swift
//  Nuro
//
//  Created by Karen Natalia on 12/10/22.
//

import Foundation
import CoreData
import UIKit

protocol ActivityRepository {
    func add(name: String, desc: String, image: UIImage, duration: Int, to category: Category)
    func getActivitiesOfCategory(category: Category) -> [Activity]
    func update(activity: Activity, newName: String, newDesc: String, newImage: UIImage, newDuration: Int, newCategory: Category)
    func delete(activity: Activity)
}

class ActivityLocalRepository: ActivityRepository {
    
    static let shared = ActivityLocalRepository()
    
    private let context = CoreDataManager.shared.context
    
    func add(name: String, desc: String, image: UIImage, duration: Int, to category: Category) {
        let newActivity = Activity(context: context)
        newActivity.activityName = name
        newActivity.activityDesc = desc
        newActivity.activityDuration = Int16(duration)
        newActivity.category = category
        newActivity.createdAt = Date()
        
        var imageData = image.pngData()
        if imageData == nil {
            imageData = image.jpegData(compressionQuality: 1.0)
        }
        newActivity.activityImage = imageData
        
        do {
            try context.save()
        } catch {
            print("Add new activity failed")
        }
    }
    
    func getActivitiesOfCategory(category: Category) -> [Activity] {
        var activities = category.activityList?.allObjects as! [Activity]
        
        activities = activities.sorted(by: { first, second in
            return first.createdAt?.compare(second.createdAt ?? Date()) == .orderedAscending
        })
        
        return activities
    }
    
    func update(activity: Activity, newName: String, newDesc: String, newImage: UIImage, newDuration: Int, newCategory: Category) {
        activity.activityName = newName
        activity.activityDesc = newDesc
        activity.activityDuration = Int16(newDuration)
        activity.category = newCategory
        
        var newImageData = newImage.pngData()
        if newImageData == nil {
            newImageData = newImage.jpegData(compressionQuality: 1.0)
        }
        activity.activityImage = newImageData
        
        do {
            try context.save()
        } catch {
            print("Failed to update activity")
        }
    }
    
    func delete(activity: Activity) {
        context.delete(activity)
        
        do {
            try context.save()
        } catch {
            print("Failed to delete activity")
        }
    }
}
