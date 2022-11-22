//
//  AddActivityViewController.swift
//  Nuro
//
//  Created by Gregorius Albert on 20/10/22.
//

import UIKit
import RxSwift
import RxDataSources
import RxCocoa
import Instructions

class AddActivityViewController: UIViewController {

    let addActivityView = AddActivityView()
    let viewModel = AddActivityViewModel()
    var delegate: AddActivityToRoutineDelegate?
    
    let coachMarksController = CoachMarksController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preferredContentSize = .init(width: ScreenSizes.modalWidth, height: ScreenSizes.modalHeight)

        addActivityView.setup(vc: self)

        viewModel.loadSegmentedControlItems(vc: self)
        
        viewModel.loadAllActivities()
        
        coachMarksController.dataSource = self
        coachMarksController.overlay.backgroundColor = Colors.Overlay.dark
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !UserDefaults.standard.bool(forKey: UserDefaultsHelper.Keys.isWalkthroughCollectionViewActivitiesCompleted){
            self.coachMarksController.start(in: .window(over: self))
            UserDefaults.standard.set(true, forKey: UserDefaultsHelper.Keys.isWalkthroughCollectionViewActivitiesCompleted)
        }
    }
    
    override func loadView() {
        self.view = addActivityView
    }


}

extension AddActivityViewController: CoachMarksControllerDelegate, CoachMarksControllerDataSource {
    
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkViewsAt index: Int, madeFrom coachMark: Instructions.CoachMark) -> (bodyView: (UIView & Instructions.CoachMarkBodyView), arrowView: (UIView & Instructions.CoachMarkArrowView)?) {
        let customBodyView = PopOverBodyView(title: Strings.walkthroughAddRoutinesTitle, subtitle: Strings.walkthroughAddRoutinesSubtitle, buttonTitle: Strings.walkthroughFinishButtonTitle)
        var customArrowView: PopOverArrowView?

        if let arrowOrientation = coachMark.arrowOrientation {
            let view = PopOverArrowView(orientation: arrowOrientation)
            customArrowView = view
        }

        return (bodyView: customBodyView, arrowView: customArrowView)
    }
    
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkAt index: Int) -> Instructions.CoachMark {
        var coachMark = coachMarksController.helper.makeCoachMark(for: addActivityView.collectionView.cellForItem(at: IndexPath(row: 3, section: 0)))
        coachMark.arrowOrientation = .top
        coachMark.gapBetweenCoachMarkAndCutoutPath = 20
        coachMark.maxWidth = 400
        UserDefaults.standard.set(true, forKey: UserDefaultsHelper.Keys.isWalkthroughCollectionViewActivitiesCompleted)
        return coachMark
    }
    
    func numberOfCoachMarks(for coachMarksController: Instructions.CoachMarksController) -> Int {
        return 1
    }
    
}
