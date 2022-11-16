//
//  ParentChildRoutineViewController.swift
//  Nuro
//
//  Created by Karen Natalia on 17/10/22.
//

import UIKit
import Instructions

class ParentChildRoutineViewController: UIViewController {

    let parentChildRoutineView = ParentChildRoutineView()
    let viewModel = ParentChildRoutineViewModel()
    
    let coachMarksController = CoachMarksController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getTodaysRoutine()
        parentChildRoutineView.setup(vc: self)
        
        self.coachMarksController.dataSource = self
        self.coachMarksController.overlay.backgroundColor = UIColor(red: 0.2, green: 0.2, blue: 0.2, alpha: 0.7)

        
        if viewModel.todaysRoutines.count == 0 {
            parentChildRoutineView.emptyState.isHidden = false
            parentChildRoutineView.routineTableView.alpha = 0
            parentChildRoutineView.startButton.isEnabled = false
            parentChildRoutineView.startButton.backgroundColor = .gray
        }
        
        NotificationCenter.default.addObserver(
            forName: UIAccessibility.guidedAccessStatusDidChangeNotification,
            object: nil,
            queue: OperationQueue.main) { _ in
                if UIAccessibility.isGuidedAccessEnabled {
                    self.parentChildRoutineView.guidedAccessLabel.attributedText = GuidedAccessLabelConfiguration.getAttributedText(boldText: "Guided Access", text: "sedang aktif")
                } else {
                    self.parentChildRoutineView.guidedAccessLabel.attributedText = GuidedAccessLabelConfiguration.getAttributedText(boldText: "Guided Access", text: "belum dinyalakan")
                }
            }
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        if !UserDefaults.standard.bool(forKey: UserDefaultsHelper.Keys.isWalkthroughStartKidsModeCompleted){
            self.coachMarksController.start(in: .window(over: self))
            UserDefaults.standard.set(true, forKey: UserDefaultsHelper.Keys.isWalkthroughStartKidsModeCompleted)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getTodaysRoutine()
        parentChildRoutineView.routineTableView.reloadData()
        (
            parentChildRoutineView.routineTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? ParentTodayActivityTableViewCell
        )?.collectionView.reloadData()
    }
    
    override func loadView() {
        self.view = parentChildRoutineView
    }
    
}

extension ParentChildRoutineViewController: CoachMarksControllerDataSource, CoachMarksControllerDelegate {
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
        var coachMark = coachMarksController.helper.makeCoachMark(for: parentChildRoutineView.startButton)
        UserDefaults.standard.set(true, forKey: UserDefaultsHelper.Keys.isWalkthroughStartKidsModeCompleted)
        //coachMark.isUserInteractionEnabledInsideCutoutPath = true
        return coachMark
    }
    
    func numberOfCoachMarks(for coachMarksController: Instructions.CoachMarksController) -> Int {
        return 1
    }
    
    
}
