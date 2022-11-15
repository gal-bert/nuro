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
        coachMarksController.overlay.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.7)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        coachMarksController.start(in: .window(over: self))
    }
    
    override func loadView() {
        self.view = addActivityView
    }


}

extension AddActivityViewController: CoachMarksControllerDelegate, CoachMarksControllerDataSource {
    
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkViewsAt index: Int, madeFrom coachMark: Instructions.CoachMark) -> (bodyView: (UIView & Instructions.CoachMarkBodyView), arrowView: (UIView & Instructions.CoachMarkArrowView)?) {
        let coachViews = coachMarksController.helper.makeDefaultCoachViews(
            withArrow: true,
            arrowOrientation: coachMark.arrowOrientation
        )

        coachViews.bodyView.hintLabel.text = "Tekan kartu aktivitas yang akan dikerjakan oleh sang anak."
        coachViews.bodyView.nextLabel.text = "Berikutnya"

        return (bodyView: coachViews.bodyView, arrowView: coachViews.arrowView)
    }
    
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkAt index: Int) -> Instructions.CoachMark {
        var coachMark = coachMarksController.helper.makeCoachMark(for: addActivityView.collectionView.cellForItem(at: IndexPath(row: 3, section: 0)))
        //coachMark.isUserInteractionEnabledInsideCutoutPath = true
        UserDefaults.standard.set(true, forKey: UserDefaultsHelper.Keys.isWalkthroughCollectionViewActivitiesCompleted)
        return coachMark
    }
    
    func numberOfCoachMarks(for coachMarksController: Instructions.CoachMarksController) -> Int {
        return 1
    }
    
}
