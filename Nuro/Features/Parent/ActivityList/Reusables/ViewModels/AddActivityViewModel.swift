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
    let disposeBag = DisposeBag()
    
    let activities = PublishSubject<[Activity]>()
    
    func loadSegmentedControlItems(vc: AddActivityViewController) {
        let categories = categoryRepository.getAll()
        let component = vc.addActivityView.segmentedControl
        for category in categories {
            component.insertSegment(withTitle: category.categoryName, at: component.numberOfSegments, animated: false)
        }
        print(component.numberOfSegments)
    }
    
//    func getNumberOfActivities() -> Observable<Int> {
//        let data = Observable<Int>.just(activityRepository.getAllActivities().count)
//        return data
//    }
    
    func loadAllActivities() {
        let query = activityRepository.getAllActivities()
        activities.onNext(query)
        activities.onCompleted()
    }
    
    func filterFromSearch() {
        
    }
    
}
