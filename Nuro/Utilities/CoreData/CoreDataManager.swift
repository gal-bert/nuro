//
//  CoreDataManager.swift
//  Nuro
//
//  Created by Karen Natalia on 11/10/22.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    let container: NSPersistentCloudKitContainer
    let context: NSManagedObjectContext
    
    private init() {
        container = NSPersistentCloudKitContainer(name: "Nuro")
        container.loadPersistentStores(completionHandler: { (_, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        context = container.viewContext
        context.automaticallyMergesChangesFromParent = true
        
        // MARK: Check if chosen mergePolicy is correct after integration with CloudKit
        context.mergePolicy = NSMergeByPropertyStoreTrumpMergePolicy
    }
    
}
