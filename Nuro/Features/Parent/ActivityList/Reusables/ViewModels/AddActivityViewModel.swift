//
//  AddActivityViewModel.swift
//  Nuro
//
//  Created by Gregorius Albert on 20/10/22.
//

import UIKit

class AddActivityViewModel {
    
    let categoryRepository = CategoryLocalRepository.shared
    let activityRepository = ActivityLocalRepository.shared
    
    func loadSegmentedControlItems(vc: AddActivityViewController) {
        let categories = categoryRepository.getAll()
        let component = vc.addActivityView.segmentedControl
        for category in categories {
            component.insertSegment(withTitle: category.categoryName, at: component.numberOfSegments, animated: false)
        }
        print(component.numberOfSegments)
    }
    
}
