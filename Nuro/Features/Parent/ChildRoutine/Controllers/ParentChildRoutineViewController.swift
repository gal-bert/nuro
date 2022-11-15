//
//  ParentChildRoutineViewController.swift
//  Nuro
//
//  Created by Karen Natalia on 17/10/22.
//

import UIKit

class ParentChildRoutineViewController: UIViewController {

    let parentChildRoutineView = ParentChildRoutineView()
    let viewModel = ParentChildRoutineViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getTodaysRoutine()
        parentChildRoutineView.setup(vc: self)
    }
    
    override func loadView() {
        self.view = parentChildRoutineView
    }
    
}
