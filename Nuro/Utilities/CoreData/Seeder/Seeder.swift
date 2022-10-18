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
    private let activityRepo = ActivityLocalRepository.shared
    
    private let categoryTemplate = ["Edukasi", "Kebersihan Diri", "Hiburan", "Olahraga", "Peliharaan", "Sehari-hari", "Tugas Rumah", "Lainnya"]
    
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
    
    func seedActivityData() {
        let activityTemplate = insertActivityTemplateData()
        
        for activity in activityTemplate {
            activityRepo.add(name: activity.activityName, desc: activity.activityDesc, image: activity.activityImage, duration: activity.activityDuration, to: activity.category)
        }
    }
    
    func insertActivityTemplateData() -> [ActivityModel] {
        var activityTemplate: [ActivityModel] = []
        var category: Category = Category()
        
        category = categoryRepo.getCategory(name: "Tugas Rumah")
        activityTemplate.append(ActivityModel(activityName: "Sapu", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Pel", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Rapikan mainan", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Siram tanaman", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Cuci piring", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Buang sampah", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Kunci pintu", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Kebersihan Diri")
        activityTemplate.append(ActivityModel(activityName: "Mandi", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Sikat gigi", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Toilet", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Pakai pakaian", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Olahraga")
        activityTemplate.append(ActivityModel(activityName: "Jalan-jalan", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Senam", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Menari", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Sepeda", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Basket", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Sepak bola", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Softball", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Badminton", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Edukasi")
        activityTemplate.append(ActivityModel(activityName: "Kerja PR", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Belajar", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Pergi kursus", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Main musik", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Terapi", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Baca buku", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Pergi sekolah", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Pakai seragam", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Hiburan")
        activityTemplate.append(ActivityModel(activityName: "Bermain", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Nonton TV", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Baca dongeng", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Peliharaan")
        activityTemplate.append(ActivityModel(activityName: "Beri makan hewan", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Ajak jalan hewan", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Mandikan hewan", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Sehari-hari")
        activityTemplate.append(ActivityModel(activityName: "Sarapan", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Makan siang", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Makan malam", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Makan buah", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Tidur siang", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Tidur malam", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Berdoa", activityDesc: "-", activityImage: UIImage(named: "dummy")!, activityDuration: 0, createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Lainnya")
        
        return activityTemplate
    }
}
