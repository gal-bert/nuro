//
//  CategoryRepository.swift
//  Nuro
//
//  Created by Karen Natalia on 11/10/22.
//

import Foundation
import CoreData

protocol CategoryRepository {
    func getAll() -> [Category]
    func addCategory(name: String)
}

class CategoryLocalRepository: CategoryRepository {
    
    static let shared = CategoryLocalRepository()
    
    private let context = CoreDataManager.shared.context
    
    func getAll() -> [Category] {
        let request: NSFetchRequest = Category.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "categoryName", ascending: true)]
        
        guard var categories = try? context.fetch(request)
        else {
            return []
        }
        
        for (index, category) in categories.enumerated() {
            if category.categoryName == Strings.Category.others {
                let temp = categories[index]
                categories.remove(at: index)
                categories.append(temp)
            }
        }
        
        return categories
    }
    
    func addCategory(name: String) {
        let newCategory = Category(context: context)
        newCategory.categoryName = name
        
        do {
            try context.save()
        } catch {
            print("Add new category failed")
        }
    }
    
    func removeAll(categories: [Category]) {
            for category in categories {
                context.delete(category)
            }
            
            do {
                try context.save()
            } catch {
                print("Failed to remove all categories")
            }
        }
}
