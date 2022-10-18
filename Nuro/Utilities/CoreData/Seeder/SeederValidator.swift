//
//  SeederValidator.swift
//  Nuro
//
//  Created by Karen Natalia on 18/10/22.
//

import Foundation

class SeederValidator {
    
    static let shared = SeederValidator()
    private let seeder = Seeder.shared
    
    func checkCategorySeedingStatus() {
        if CategoryLocalRepository.shared.getAll().isEmpty {
            seeder.seedCategoryData()
        }
    }
    
    func checkRoutineHeaderSeedingStatus() {
        if RoutineHeaderLocalRepository.shared.getAll().isEmpty {
            seeder.seedRoutineHeaderData()
        }
    }
    
    func checkActivitySeedingStatus() {
        if ActivityLocalRepository.shared.getActivitiesOfCategory(category: CategoryLocalRepository.shared.getCategory(name: "Edukasi")).isEmpty {
            seeder.seedActivityData()
        }
    }
}
