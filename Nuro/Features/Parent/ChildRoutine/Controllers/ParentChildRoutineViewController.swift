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
        self.coachMarksController.overlay.backgroundColor = Colors.Overlay.dark
        
        if viewModel.todaysRoutines.count == 0 {
            parentChildRoutineView.emptyState.isHidden = false
            parentChildRoutineView.routineTableView.alpha = 0
            parentChildRoutineView.startButton.isEnabled = false
            parentChildRoutineView.startButton.backgroundColor = .gray
        }
        
        if UserDefaults.standard.bool(forKey: UserDefaultsHelper.Keys.isGuidedAccessEnabled) {
            self.parentChildRoutineView.guidedAccessLabel.attributedText = GuidedAccessLabelConfiguration.getAttributedText(boldText: "Guided Access", text: "sedang aktif")
            
        } else {
            self.parentChildRoutineView.guidedAccessLabel.attributedText = GuidedAccessLabelConfiguration.getAttributedText(boldText: "Guided Access", text: "belum dinyalakan")
        }
        
        NotificationCenter.default.addObserver(
            forName: UIAccessibility.guidedAccessStatusDidChangeNotification,
            object: nil,
            queue: OperationQueue.main) { _ in
                if UIAccessibility.isGuidedAccessEnabled {
                    UserDefaults.standard.set(true, forKey: UserDefaultsHelper.Keys.isGuidedAccessEnabled)
                    self.parentChildRoutineView.guidedAccessLabel.attributedText = GuidedAccessLabelConfiguration.getAttributedText(boldText: "Guided Access", text: "sedang aktif")
                } else {
                    UserDefaults.standard.set(false, forKey: UserDefaultsHelper.Keys.isGuidedAccessEnabled)
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
        
        let coachMarkBodyView = PopOverBodyView(title: "Mulai Rutinitas Anak", subtitle: "Tekan\"Mulai Rutinitas Anak\" untuk memasuki halaman anak.", buttonTitle: "Mengerti")
        var coachMarkArrowView: PopOverArrowView?

        if let arrowOrientation = coachMark.arrowOrientation {
            let view = PopOverArrowView(orientation: arrowOrientation)
            coachMarkArrowView = view
        }

        return (bodyView: coachMarkBodyView, arrowView: coachMarkArrowView)
    }
    
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkAt index: Int) -> Instructions.CoachMark {
        var coachMark = coachMarksController.helper.makeCoachMark(for: parentChildRoutineView.startButton)
        UserDefaults.standard.set(true, forKey: UserDefaultsHelper.Keys.isWalkthroughStartKidsModeCompleted)
        coachMark.arrowOrientation = .bottom
        coachMark.gapBetweenCoachMarkAndCutoutPath = 20
        coachMark.maxWidth = 400
        return coachMark
    }
    
    func numberOfCoachMarks(for coachMarksController: Instructions.CoachMarksController) -> Int {
        return 1
    }
    
    
}
