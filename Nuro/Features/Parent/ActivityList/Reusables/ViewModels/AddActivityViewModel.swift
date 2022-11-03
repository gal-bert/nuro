//
//  AddActivityViewModel.swift
//  Nuro
//
//  Created by Gregorius Albert on 20/10/22.
//

import UIKit
import RxSwift
import RxDataSources

class AddActivityViewModel {
    
    let categoryRepository = CategoryLocalRepository.shared
    let activityRepository = ActivityLocalRepository.shared
    var activities = [Activity]()

    
    func loadSegmentedControlItems(vc: AddActivityViewController) {
        let categories = categoryRepository.getAll()
        let component = vc.addActivityView.segmentedControl
        for category in categories {
            component.insertSegment(withTitle: category.categoryName, at: component.numberOfSegments, animated: false)
        }
    }
    
    func getNumberOfActivities() -> Int {
        return activities.count
    }
    
    func loadAllActivities() {
        activities = activityRepository.getAllActivities()
    }
    
    func filterFromSearch() {
        
    }
    
}
