//
//  ParentActivityListViewModel.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 05/10/22.
//

import Foundation

class ParentActivityListViewModel {
    
    let categoryRepository = CategoryLocalRepository.shared
    let activityRepository = ActivityLocalRepository.shared
    
    var categoryActivities = [Category]()
    var activityList = [Activity]()
    var filteredActivities = [Activity]()
    
    func loadAllCategory() {
        categoryActivities = categoryRepository.getAll()
        activityList = activityRepository.getAllActivities()
        filteredActivities = activityList
    }
    
    func printText(text: String) {
        print("\(text)")
    }
    
}
