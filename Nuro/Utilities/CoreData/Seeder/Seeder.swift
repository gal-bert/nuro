//
//  Seeder.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/10/22.
//

import UIKit

class Seeder {
    
    static let shared = Seeder()
    
    private let routineHeaderRepo = RoutineHeaderLocalRepository.shared
    private let categoryRepo = CategoryLocalRepository.shared
    
    private let categoryTemplate = ["Kebersihan Diri", "Olahraga", "Makan", "Edukasi", "Peliharaan", "Tugas Rumah", "Lainnya", "Sehari-hari"]
    
    func seedCategoryData() {
        for category in categoryTemplate {
            categoryRepo.addCategory(name: category)
        }
    }
    
    func seedRoutineHeaderData() {
        for dayNumber in 1...7 {
            for timeNumber in 1...3 {
                routineHeaderRepo.add(dayID: dayNumber, timeID: timeNumber)
            }
        }
    }
}
