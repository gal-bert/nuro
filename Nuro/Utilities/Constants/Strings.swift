//
//  Strings.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/10/22.
//

import Foundation

/// Put strings here to support localization in the future?
/// Put strings here for reusables

enum Strings {
    static let parentTodayActivityTitle = "Hari Ini"
    static let parentRoutineTitle = "Penjadwalan"
    static let parentActivityListTitle = "Aktivitas"
    static let childRoutineTitle = "Mode Anak"
    static let settingsTitle = "Pengaturan"
    static let kidsName = UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.kidsName) ?? "Anak"
    static let parentsName = UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.parentsName) ?? "Mom"
    static let emptyDescTextViewPlaceHolder = "Ketik kalimat reward singkat untuk anak saat menyelesaikan aktivitas..."
    static let maxOnboardingPage = "4"
    
    static let walkthroughRoutinesTitle = "Tambah Aktivitas"
    static let walkthroughRoutinesSubtitle = "Buka halaman Penjadwalan untuk menambahkan aktivitas harian."
    static let walkthroughAddRoutinesTitle = "Tambah Aktivitas"
    static let walkthroughAddRoutinesSubtitle = "Tekan tombol \"+\" untuk menambahkan aktivitas baru."
    static let walkthroughSelectActivitiesTitle = "Pilih Aktivitas"
    static let walkthroughSelectActivitiesSubtitle = "Pilih aktivitas yang akan dikerjakan oleh sang anak."
    static let walkthroughCollectionViewActivitiesTitle = "Pilih Aktivitas"
    static let walkthroughCollectionViewActivitiesSubtitle = "Tekan kartu aktivitas yang akan dikerjakan oleh sang anak."
    static let walkthroughAddActivityToRoutineTitle = "Tambah Aktivitas"
    static let walkthroughAddActivityToRoutineSubtitle = "Tekan \"Tambah\" jika aktivitas yang dipilih sudah sesuai."
    static let walkthroughKidsModeTitle = "Mulai Rutinitas Anak"
    static let walkthroughKidsModeSubtitle = "Jika jadwal rutinitas telah selesai dibuat, buka halaman Rutinitas Anak."
    static let walkthroughStartKidsModeTitle = "Mulai Rutinitas Anak"
    static let walkthroughStartKidsModeSubtitle = "Tekan \"Mulai Rutinitas Anak\" untuk memasuki halaman anak."
    static let walkthroughNextButtonTitle = "Berikutnya"
    static let walkthroughFinishButtonTitle = "Mengerti"

    enum Category {
        static let others = "Lainnya"
    }
}
