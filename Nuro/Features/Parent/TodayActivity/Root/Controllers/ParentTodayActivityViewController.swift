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

    override func viewDidLoad() {
        super.viewDidLoad()
        parentTodayActivityView.setup(vc: self)
        viewModel.loadAll(dayId: Date().getCurrentWeekday())
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
