//
//  ParentTodayActivityViewController.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/10/22.
//

import UIKit

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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if UserDefaults.standard.bool(forKey: UserDefaultsHelper.Keys.isLocked) {
            let starterVC = ChildStarterViewController()
            let routineVC = ChildRoutineViewController()
            let nav = UINavigationController()
            nav.modalPresentationStyle = .fullScreen
            nav.setViewControllers([starterVC, routineVC], animated: false)
            self.present(nav, animated: false)
        }
    }

    override func loadView() {
        self.view = parentTodayActivityView
    }
    
    
}
