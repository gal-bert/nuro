//
//  ChildRoutineViewController.swift
//  Nuro
//
//  Created by Karen Natalia on 05/10/22.
//

import UIKit

class ChildRoutineViewController: UIViewController {
    
    var hideFirstActivityCard = false
    private var totalActivity = 0
    
    private let childRoutineView = ChildRoutineView()
    let viewModel = ChildRoutineViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        childRoutineView.setup(vc: self)
        totalActivity = viewModel.activityName.count
    }
    
    override func loadView() {
        self.view = childRoutineView
    }
    
    func nextActivity() {
        hideFirstActivityCard = true
        
        childRoutineView.animateHideRow()
        viewModel.removeFirstActivity()
        Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false) { [self] timer in
            childRoutineView.animateToNextActivity(totalActivity: totalActivity, currTotalActivity: viewModel.activityName.count)
        }
        
        hideFirstActivityCard = false
    }
}
