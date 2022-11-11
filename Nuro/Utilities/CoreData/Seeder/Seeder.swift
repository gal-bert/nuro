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
    
    func seedAll() {
        seedCategoryData()
        seedActivityData()
        seedRoutineHeaderData()
        seedDummyRoutine()
    }
    
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
        
        category = categoryRepo.getCategory(name: "Tugas Rumah")
        activityTemplate.append(ActivityModel(activityName: "Sapu", activityDesc: "Lantai bebas dari debu", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Sapu")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Pel", activityDesc: "Lantai menjadi bersih", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Pel")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Siram tanaman", activityDesc: "Tanaman tumbuh besar", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Siram_tanaman")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Cuci piring", activityDesc: "Piring bersih dari kuman", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Cuci_Piring")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Buang sampah", activityDesc: "Lingkunganmu jadi bersih", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Membuang_sampah")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Kunci pintu", activityDesc: "Rumahmu jadi aman", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_kunci_pintu")), createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Kebersihan Diri")
        activityTemplate.append(ActivityModel(activityName: "Mandi", activityDesc: "Badan bersih dan segar", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Mandi")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Sikat gigi", activityDesc: "Gigi bersih dan putih", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Sikat_gigi")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Toilet", activityDesc: "Tubuhmu menjadi lega", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Toilet")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Pakai pakaian", activityDesc: "Badanmu terlindungi", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Berpakaian")), createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Olahraga")
        activityTemplate.append(ActivityModel(activityName: "Jalan-jalan", activityDesc: "Tubuhmu sehat dan kuat", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Jalan_jalan")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Senam", activityDesc: "Tubuhmu sehat dan kuat", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Senam")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Menari", activityDesc: "Tubuhmu sehat dan kuat", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_menari")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Sepeda", activityDesc: "Tubuhmu sehat dan kuat", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Sepeda")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Basket", activityDesc: "Tubuhmu sehat dan kuat", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Basketball")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Sepak bola", activityDesc: "Tubuhmu sehat dan kuat", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Sepakbola")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Softball", activityDesc: "Tubuhmu sehat dan kuat", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Softball")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Badminton", activityDesc: "Tubuhmu sehat dan kuat", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Badminton")), createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Edukasi")
        activityTemplate.append(ActivityModel(activityName: "Kerja PR", activityDesc: "Gurumu pasti senang", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Pekerjaan_Rumah")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Belajar", activityDesc: "Pengetahuanmu semakin luas", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Belajar")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Pergi kursus", activityDesc: "Agar dirimu pintar", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_kursus")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Main musik", activityDesc: "Perasaan tenang", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_music")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Baca buku", activityDesc: "Kamu menjadi semakin pintar", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Membaca_buku")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Pergi sekolah", activityDesc: "Agar lebih pintar", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Pergi_Sekolah")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Pakai seragam", activityDesc: "Agar terlihat rapih", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Seragam_sekolah")), createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Hiburan")
        activityTemplate.append(ActivityModel(activityName: "Bermain", activityDesc: "Siap melanjutkan aktivitas", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Bermain")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Nonton TV", activityDesc: "Pengetahuanmu semakin luas", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Nonton_televisi")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Baca dongeng", activityDesc: "Siap beristirahat", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Waktu_cerita")), createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Peliharaan")
        activityTemplate.append(ActivityModel(activityName: "Beri makan hewan", activityDesc: "Hewan kenyang dan sehat", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Beri_makan_hewan")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Ajak jalan hewan", activityDesc: "Hewan senang dan sehat", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Jalan_peliharaan")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Mandikan hewan", activityDesc: "Hewan jadi bersih", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Mandi_peliharaan")), createdAt: Date(), category: category))
        
        category = categoryRepo.getCategory(name: "Sehari-hari")
        activityTemplate.append(ActivityModel(activityName: "Makan", activityDesc: "Gizi tubuhmu terpenuhi", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Makan")), createdAt: Date(), category: category))
        activityTemplate.append(ActivityModel(activityName: "Tidur", activityDesc: "Energimu terisi kembali", activityImageURL: Document.saveToDocument(image: UIImage(named: "activity_Tidur")), createdAt: Date(), category: category))

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
        routineDetailRepo.add(dayID: 1, timeID: 2, activity: activities[2])
        routineDetailRepo.add(dayID: 1, timeID: 2, activity: activities[4])
        routineDetailRepo.add(dayID: 1, timeID: 3, activity: activities[6])
        routineDetailRepo.add(dayID: 1, timeID: 3, activity: activities[8])
        
        routineDetailRepo.add(dayID: 2, timeID: 1, activity: activities[1])
        routineDetailRepo.add(dayID: 3, timeID: 1, activity: activities[3])
        routineDetailRepo.add(dayID: 4, timeID: 1, activity: activities[5])

        routineDetailRepo.add(dayID: 5, timeID: 1, activity: activities[7])
        routineDetailRepo.add(dayID: 5, timeID: 1, activity: activities[1])
        routineDetailRepo.add(dayID: 5, timeID: 1, activity: activities[3])
        routineDetailRepo.add(dayID: 5, timeID: 2, activity: activities[5])
        routineDetailRepo.add(dayID: 5, timeID: 2, activity: activities[9])
        routineDetailRepo.add(dayID: 5, timeID: 3, activity: activities[2])
        routineDetailRepo.add(dayID: 5, timeID: 3, activity: activities[4])

        routineDetailRepo.add(dayID: 6, timeID: 1, activity: activities[9])
        routineDetailRepo.add(dayID: 7, timeID: 2, activity: activities[2])
        routineDetailRepo.add(dayID: 2, timeID: 2, activity: activities[4])
        routineDetailRepo.add(dayID: 4, timeID: 3, activity: activities[6])
        routineDetailRepo.add(dayID: 1, timeID: 3, activity: activities[8])
    }
}
