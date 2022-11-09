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
        print("did load")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("did appear")
    }

    override func loadView() {
        self.view = parentTodayActivityView
    }
    
    
}
