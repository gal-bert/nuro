//
//  ParentActivityListDetailViewModel.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 18/10/22.
//

import Foundation

class ParentActivityListDetailViewModel {
    
    let activityRepository = ActivityLocalRepository.shared

    var categorySelected: Category?
    var activityList = [Activity]()
    var filteredActivities = [Activity]()
    
    func loadAllActivity() {
        activityList = activityRepository.getActivitiesOfCategory(category: categorySelected ?? Category())
        filteredActivities = activityList
    }
    
    func printText(text: String) {
        print("\(text)")
    }
    
    }
