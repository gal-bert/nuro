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
        
        self.coachMarksController.overlay.backgroundColor = Colors.Overlay.dark
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
        let customBodyView = PopOverBodyView(title: Strings.walkthroughAddRoutinesTitle, subtitle: Strings.walkthroughAddRoutinesSubtitle, buttonTitle: Strings.walkthroughNextButtonTitle)
        var customArrowView: PopOverArrowView?

        if let arrowOrientation = coachMark.arrowOrientation {
            let view = PopOverArrowView(orientation: arrowOrientation)
            customArrowView = view
        }

        return (bodyView: customBodyView, arrowView: customArrowView)
    }
    
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkAt index: Int) -> Instructions.CoachMark {
        var coachMark = coachMarksController.helper.makeCoachMark(for: parentRoutineView.addButton)
        coachMark.arrowOrientation = .top
        coachMark.gapBetweenCoachMarkAndCutoutPath = 20
        coachMark.maxWidth = 400
        UserDefaults.standard.set(true, forKey: UserDefaultsHelper.Keys.isWalkthroughAddRoutinesCompleted)
        return coachMark
    }
    
    func numberOfCoachMarks(for coachMarksController: Instructions.CoachMarksController) -> Int {
        return 1
    }
}
