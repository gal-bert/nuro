//
//  ChildRoutineViewController.swift
//  Nuro
//
//  Created by Karen Natalia on 05/10/22.
//

import UIKit

class ChildRoutineViewController: UIViewController {
    
    var isFirstActivityCardHidden  = false
    private var totalActivity = 0
    
    private let childRoutineView = ChildRoutineView()
    let viewModel = ChildRoutineViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // TODO: Set current routine dayID and timeID
        viewModel.loadActivities(dayID: 1, timeID: 1)
        
        childRoutineView.setup(vc: self)
        totalActivity = viewModel.activities.count
    }
    
    override func loadView() {
        self.view = childRoutineView
    }
    
    func nextActivity() {
        isFirstActivityCardHidden  = true
        
        childRoutineView.animateHideRow()
        if viewModel.activities.count > 0 {
            viewModel.removeFirstActivity()
            Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { [self] timer in
                childRoutineView.animateToNextActivity(totalActivity: totalActivity, currTotalActivity: viewModel.activities.count)
            }
        }
        else {
            // Segue ke activity done
        }
        
        
        isFirstActivityCardHidden  = false
    }
}
