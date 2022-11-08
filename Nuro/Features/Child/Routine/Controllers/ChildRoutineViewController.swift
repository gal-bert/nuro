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
    var willBeAnimated = false
    
    let childRoutineView = ChildRoutineView()
    let viewModel = ChildRoutineViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.loadActivities(dayID: Date().getCurrentWeekday(), timeID: Date().getTimeframeId())
        
        totalActivity = viewModel.activities.count
        childRoutineView.setup(vc: self, totalActivity: totalActivity)
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Transition.smoothAnimationWithDelay(view: childRoutineView, subviews: childRoutineView.subviews, bgColor: Colors.Neutral.white, delayForViews: childRoutineView.getDelayedView(), delayTime: Transition.DelayTime.fullDelay)
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { [self] timer in
            if willBeAnimated {
                nextActivity()
            }
        }
    }
    
    override func loadView() {
        self.view = childRoutineView
    }
    
    func nextActivity() {
        isFirstActivityCardHidden  = true
        
        Timer.scheduledTimer(withTimeInterval: 0.5, repeats: false) { [self] timer in
            childRoutineView.disableButtons()
            childRoutineView.animateHideRow()
            viewModel.removeFirstActivity()
            
            if totalActivity != 1 {
                Timer.scheduledTimer(withTimeInterval: 0.8, repeats: false) { [self] timer in
                    childRoutineView.animateToNextActivity(totalActivity: totalActivity, currTotalActivity: viewModel.activities.count)
                }
            }
            
            if viewModel.activities.count == 0 {
                Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
                    let dest = ChildRoutineCompletedViewController()
                    dest.modalPresentationStyle = .fullScreen
                    dest.modalTransitionStyle = .crossDissolve
                    
                    Transition.animateTransition(vc: self)
                    self.navigationController?.pushViewController(dest, animated: false)
                }
            }
            
            isFirstActivityCardHidden  = false
            willBeAnimated = false
        }
    }
}
