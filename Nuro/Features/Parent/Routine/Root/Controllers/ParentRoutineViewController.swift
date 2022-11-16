//
//  ParentRoutineViewController.swift
//  Nuro
//
//  Created by Samuel Dennis on 05/10/22.
//

import UIKit
import Instructions

class ParentRoutineViewController: UIViewController {

    let parentRoutineView = ParentRoutineView()
    let viewModel = ParentRoutineViewModel()
    
    let coachMarksController = CoachMarksController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parentRoutineView.setup(vc: self)
        viewModel.loadAll(dayId: parentRoutineView.segmentedControl.selectedSegmentIndex+1)
        
        self.coachMarksController.overlay.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.7)
        self.coachMarksController.dataSource = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !UserDefaults.standard.bool(forKey: UserDefaultsHelper.Keys.isWalkthroughAddRoutinesCompleted){
            self.coachMarksController.start(in: .window(over: self))
            UserDefaults.standard.set(true, forKey: UserDefaultsHelper.Keys.isWalkthroughAddRoutinesCompleted)
        }
    }
    
    override func loadView() {
        self.view = parentRoutineView
    }
}

extension ParentRoutineViewController: CoachMarksControllerDataSource, CoachMarksControllerDelegate {
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkViewsAt index: Int, madeFrom coachMark: Instructions.CoachMark) -> (bodyView: (UIView & Instructions.CoachMarkBodyView), arrowView: (UIView & Instructions.CoachMarkArrowView)?) {
        let coachViews = coachMarksController.helper.makeDefaultCoachViews(
            withArrow: true,
            arrowOrientation: coachMark.arrowOrientation
        )

        coachViews.bodyView.hintLabel.text = "Tekan “Mulai Rutinitas Anak” untuk memasuki halaman anak. "
        coachViews.bodyView.nextLabel.text = "Berikutnya"

        return (bodyView: coachViews.bodyView, arrowView: coachViews.arrowView)
    }
    
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkAt index: Int) -> Instructions.CoachMark {
        var coachMark = coachMarksController.helper.makeCoachMark(for: parentRoutineView.addButton)
        //coachMark.isUserInteractionEnabledInsideCutoutPath = true
        UserDefaults.standard.set(true, forKey: UserDefaultsHelper.Keys.isWalkthroughAddRoutinesCompleted)
        return coachMark
    }
    
    func numberOfCoachMarks(for coachMarksController: Instructions.CoachMarksController) -> Int {
        return 1
    }
}
