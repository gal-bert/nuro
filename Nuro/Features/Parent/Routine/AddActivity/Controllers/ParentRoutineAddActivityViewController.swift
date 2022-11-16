//
//  ParentRoutineAddActivityViewController.swift
//  Nuro
//
//  Created by Samuel Dennis on 24/10/22.
//

import UIKit
import Instructions

class ParentRoutineAddActivityViewController: UIViewController {
    
    let parentRoutineAddActivityView = ParentRoutineAddActivityView()
    var activity: Activity?
    var days: [Int]?
    var times: [Int]?
    var selectedIndex: Int?
    var reloadDelegate: ReloadDelegate?
    
    let coachMarksController = CoachMarksController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModalInPresentation = true
        
        days = [selectedIndex ?? 1]
        
        parentRoutineAddActivityView.setup(vc: self)
        coachMarksController.dataSource = self
        self.coachMarksController.overlay.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.7)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !UserDefaults.standard.bool(forKey: UserDefaultsHelper.Keys.isWalkthroughSelectActivitiesCompleted){
            self.coachMarksController.start(in: .window(over: self))
            UserDefaults.standard.set(true, forKey: UserDefaultsHelper.Keys.isWalkthroughSelectActivitiesCompleted)
        }
    }
    
    override func loadView() {
        view = parentRoutineAddActivityView
    }

}

extension ParentRoutineAddActivityViewController: CoachMarksControllerDelegate, CoachMarksControllerDataSource {
    
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkViewsAt index: Int, madeFrom coachMark: Instructions.CoachMark) -> (bodyView: (UIView & Instructions.CoachMarkBodyView), arrowView: (UIView & Instructions.CoachMarkArrowView)?) {
        let coachViews = coachMarksController.helper.makeDefaultCoachViews(
            withArrow: true,
            arrowOrientation: coachMark.arrowOrientation
        )
        
        switch index {
            case 0:
                coachViews.bodyView.hintLabel.text = "Pilih Aktivitas yang akan dikerjakan oleh sang anak."
                coachViews.bodyView.nextLabel.text = "Berikutnya"
            case 1:
                coachViews.bodyView.hintLabel.text = "Tekan “Tambah” jika aktivitas yang dipilih sudah sesuai."
                coachViews.bodyView.nextLabel.text = "Berikutnya"
            default: break

        }

        return (bodyView: coachViews.bodyView, arrowView: coachViews.arrowView)
    }
    
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkAt index: Int) -> Instructions.CoachMark {
                
        switch index {
        case 0:
            var coachMark = coachMarksController.helper.makeCoachMark(for: parentRoutineAddActivityView.stackView)
            //coachMark.isUserInteractionEnabledInsideCutoutPath = true
            UserDefaults.standard.set(true, forKey: UserDefaultsHelper.Keys.isWalkthroughSelectActivitiesCompleted)
            return coachMark
        case 1:
            var coachMark = coachMarksController.helper.makeCoachMark(for: parentRoutineAddActivityView.addButton)
            //coachMark.isUserInteractionEnabledInsideCutoutPath = true
            UserDefaults.standard.set(true, forKey: UserDefaultsHelper.Keys.isWalkthroughAddActivityToRoutineCompleted)
            return coachMark
        default:
            return coachMarksController.helper.makeCoachMark()
        }
    }
    
    func numberOfCoachMarks(for coachMarksController: Instructions.CoachMarksController) -> Int {
        return 2
    }
    
}
