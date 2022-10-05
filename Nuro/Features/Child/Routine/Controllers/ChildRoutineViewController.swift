//
//  ChildRoutineViewController.swift
//  Nuro
//
//  Created by Karen Natalia on 05/10/22.
//

import UIKit

class ChildRoutineViewController: UIViewController {
    
    // MARK: Dummy data
    var activityName = ["Aktivitas 1", "Aktivitas 2", "Aktivitas 3", "Aktivitas 4", "Aktivitas 5"]
    var activityImageName = ["face.smiling", "pencil", "square.and.arrow.up", "cup.and.saucer.fill", "bed.double.fill"]
    var hide = false
    var totalActivity = 0
    
    let childRoutineView = ChildRoutineView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        childRoutineView.setup(vc: self)
        totalActivity = activityName.count
    }
    
    override func loadView() {
        self.view = childRoutineView
    }
    
    func nextActivity() {
        hide = true
        childRoutineView.animateHideRow()
        
        activityName.removeFirst()
        activityImageName.removeFirst()
        Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { timer in
            UIView.animate(withDuration: 1, delay: 0.5, options: .curveEaseIn, animations: { [self] in
                childRoutineView.animateDeleteRow()
                if totalActivity == activityName.count + 1 {
                    childRoutineView.animateStickStartMovement()
                }
                else if activityName.count == 1 {
                    childRoutineView.animateStickEndMovement()
                }
            }, completion: { _ in
                self.hide = false
            })
        }
    }
}
