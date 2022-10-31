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
    private let routineDetailRepo = RoutineDetailLocalRepository.shared
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
            activityRepo.add(name: activity.activityName, desc: activity.activityDesc, imageURL: activity.activityImageURL, to: activity.category)
        }
    }
    
    func insertActivityTemplateData() -> [ActivityModel] {
        var activityTemplate: [ActivityModel] = []
        var category: Category = Category()
        
        // MARK: DUMMY IMAGE IN DOCUMENT
        let fileURL = Document.saveToDocument(image: UIImage(named: "test"))
        
        category = categoryRepo.getCategory(name: "Tugas Rumah")
        activityTemplate.append(ActivityModel(activityName: "Sapu", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Pel", activityDesc: "Mengepel agar wangi!", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Rapikan mainan", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Siram tanaman", activityDesc: "Supaya tanaman tidak mati", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Cuci piring", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Buang sampah", activityDesc: "Agar ruangan tidak bau", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Kunci pintu", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Kebersihan Diri")
        activityTemplate.append(ActivityModel(activityName: "Mandi", activityDesc: "Agar badanmu bersih", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Sikat gigi", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Toilet", activityDesc: "Yang ini gatau apa", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Pakai pakaian", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Olahraga")
        activityTemplate.append(ActivityModel(activityName: "Jalan-jalan", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Senam", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Menari", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Sepeda", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Basket", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Sepak bola", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Softball", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Badminton", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Edukasi")
        activityTemplate.append(ActivityModel(activityName: "Kerja PR", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Belajar", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Pergi kursus", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Main musik", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Terapi", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Baca buku", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Pergi sekolah", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Pakai seragam", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Hiburan")
        activityTemplate.append(ActivityModel(activityName: "Bermain", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Nonton TV", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Baca dongeng", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Peliharaan")
        activityTemplate.append(ActivityModel(activityName: "Beri makan hewan", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Ajak jalan hewan", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Mandikan hewan", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Sehari-hari")
        activityTemplate.append(ActivityModel(activityName: "Sarapan", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Makan siang", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Makan malam", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Makan buah", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Tidur siang", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Tidur malam", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Berdoa", activityDesc: "-", activityImageURL: fileURL, createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Lainnya")
        
        return activityTemplate
    }

    func seedDummyRoutine() {
        let activities = activityRepo.getAllActivities()
        routineDetailRepo.add(dayID: 1, timeID: 1, activity: activities[1])
        routineDetailRepo.add(dayID: 1, timeID: 1, activity: activities[3])
        routineDetailRepo.add(dayID: 1, timeID: 1, activity: activities[5])
        routineDetailRepo.add(dayID: 1, timeID: 1, activity: activities[7])
        routineDetailRepo.add(dayID: 1, timeID: 1, activity: activities[9])
    }
}
