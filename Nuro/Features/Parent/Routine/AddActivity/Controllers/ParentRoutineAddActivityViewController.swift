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
        self.coachMarksController.overlay.backgroundColor = Colors.Overlay.dark
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
        var customBodyView = PopOverBodyView()
        var customArrowView: PopOverArrowView?
        
        switch index {
        case 0:
            customBodyView = PopOverBodyView(title: Strings.walkthroughSelectActivitiesTitle, subtitle: Strings.walkthroughSelectActivitiesSubtitle, buttonTitle: Strings.walkthroughNextButtonTitle)
        case 1:
            customBodyView = PopOverBodyView(title: Strings.walkthroughAddActivityToRoutineTitle, subtitle: Strings.walkthroughAddActivityToRoutineSubtitle, buttonTitle: Strings.walkthroughNextButtonTitle)
        default:
            break
        }
        
        if let orientation = coachMark.arrowOrientation {
            customArrowView = PopOverArrowView(orientation: orientation)
        }
        
        return (bodyView: customBodyView, arrowView: customArrowView)
    }
    
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkAt index: Int) -> Instructions.CoachMark {
                
        switch index {
        case 0:
            var coachMark = coachMarksController.helper.makeCoachMark(for: parentRoutineAddActivityView.stackView)
            coachMark.gapBetweenCoachMarkAndCutoutPath = 20
            coachMark.maxWidth = 400
            coachMark.arrowOrientation = .top
            UserDefaults.standard.set(true, forKey: UserDefaultsHelper.Keys.isWalkthroughSelectActivitiesCompleted)
            return coachMark
        case 1:
            var coachMark = coachMarksController.helper.makeCoachMark(for: parentRoutineAddActivityView.addButton)
            coachMark.gapBetweenCoachMarkAndCutoutPath = 20
            coachMark.maxWidth = 400
            coachMark.arrowOrientation = .top
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
