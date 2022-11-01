//
//  ParentActivityListViewModel.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 05/10/22.
//

import Foundation

class ParentActivityListViewModel {
    
    let categoryRepository = CategoryLocalRepository.shared
    
    var categoryActivities = [Category]()
    
    func loadAllCategory() {
        categoryActivities = categoryRepository.getAll()
    }
    
    func printText(text: String) {
        print("\(text)")
    }
    
}
