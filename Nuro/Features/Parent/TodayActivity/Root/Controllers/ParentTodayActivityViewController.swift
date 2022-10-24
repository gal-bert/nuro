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

        viewModel.loadAll(dayId: 1)

    }
    
    override func loadView() {
        self.view = parentTodayActivityView
    }
    
    
}
