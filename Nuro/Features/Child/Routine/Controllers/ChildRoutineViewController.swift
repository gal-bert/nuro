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
    var activityImageName = ["face.smiling", "bathtub.fill", "carrot.fill", "cup.and.saucer.fill", "bed.double.fill"]
    
    let childRoutineView = ChildRoutineView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        childRoutineView.setup(vc: self)
    }
    
    override func loadView() {
        self.view = childRoutineView
    }
}
