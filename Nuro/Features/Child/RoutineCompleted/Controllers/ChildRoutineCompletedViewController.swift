//
//  ChildRoutineCompletedViewController.swift
//  Nuro
//
//  Created by Karen Natalia on 24/10/22.
//

import UIKit

class ChildRoutineCompletedViewController: UIViewController {

    private let childRoutineCompletedView = ChildRoutineCompletedView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        childRoutineCompletedView.setup(vc: self)
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func loadView() {
        self.view = childRoutineCompletedView
    }
}
