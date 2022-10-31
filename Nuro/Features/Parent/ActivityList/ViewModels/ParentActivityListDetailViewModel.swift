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
    var listActivities = [Activity]()
    
    func loadAllActivity() {
        listActivities = activityRepository.getActivitiesOfCategory(category: categorySelected ?? Category())
    }
    
    func printText(text: String) {
        print("\(text)")
    }
    
    }
