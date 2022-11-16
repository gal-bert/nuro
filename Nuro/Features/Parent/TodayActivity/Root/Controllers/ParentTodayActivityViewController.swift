//
//  ParentTodayActivityViewController.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/10/22.
//

import UIKit
import Instructions

class ParentTodayActivityViewController: UIViewController {
    
    let parentTodayActivityView = ParentTodayActivityView()
    let viewModel = ParentTodayActivityViewModel()

    var activities = [RoutineHeaderModel]()
    var routineDetailRepository = RoutineDetailLocalRepository.shared
    
    let coachMarksController = CoachMarksController()

    override func viewDidLoad() {
        super.viewDidLoad()
        parentTodayActivityView.setup(vc: self)
        viewModel.loadAll(dayId: Date().getCurrentWeekday())
        
        self.coachMarksController.dataSource = self
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        self.coachMarksController.start(in: .window(over: self))
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.bool(forKey: UserDefaultsHelper.Keys.isLocked) {
            var vcStack = [UIViewController]()
            let starterVC = ChildStarterViewController()
            vcStack.append(starterVC)
            
            if MirrorDetailLocalRepository.shared.getMirrorDetails(timeID: Date().getTimeframeId()).count == 0 {
                let routineCompletedVC = ChildRoutineCompletedViewController()
                vcStack.append(routineCompletedVC)
            }
            else {
                let routineVC = ChildRoutineViewController()
                vcStack.append(routineVC)
            }
            
            let nav = UINavigationController()
            nav.modalPresentationStyle = .fullScreen
            nav.setViewControllers(vcStack, animated: false)
            self.present(nav, animated: false)
        }
    }

    override func loadView() {
        self.view = parentTodayActivityView
    }
    
    

    
}

extension ParentTodayActivityViewController: CoachMarksControllerDataSource, CoachMarksControllerDelegate {
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkViewsAt index: Int, madeFrom coachMark: Instructions.CoachMark) -> (bodyView: (UIView & Instructions.CoachMarkBodyView), arrowView: (UIView & Instructions.CoachMarkArrowView)?) {
        let coachViews = coachMarksController.helper.makeDefaultCoachViews(
            withArrow: true,
            arrowOrientation: coachMark.arrowOrientation
        )

        coachViews.bodyView.hintLabel.text = "Tekan tombol '+' untuk menambahkan aktivitas baru."
        coachViews.bodyView.nextLabel.text = "Berikutnya"

        return (bodyView: coachViews.bodyView, arrowView: coachViews.arrowView)
    }
    
    func coachMarksController(_ coachMarksController: Instructions.CoachMarksController, coachMarkAt index: Int) -> Instructions.CoachMark {
        return coachMarksController.helper.makeCoachMark(for: parentTodayActivityView.jumbotron)
    }
    
    func numberOfCoachMarks(for coachMarksController: Instructions.CoachMarksController) -> Int {
        return 1
    }
    
    
}
