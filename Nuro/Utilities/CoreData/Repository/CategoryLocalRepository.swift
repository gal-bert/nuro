//
//  CategoryRepository.swift
//  Nuro
//
//  Created by Karen Natalia on 11/10/22.
//

import Foundation
import CoreData

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
                break
            }
        }
        
        return categories
    }
    
    func getCategory(name: String) -> Category {
        let request: NSFetchRequest = Category.fetchRequest()
        request.predicate = NSPredicate(format: "categoryName = %@", name)
        
        guard let categories = try? context.fetch(request)
        else {
            return Category()
        }
        
        return categories[0]
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
    
}
