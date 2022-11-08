//
//  ParentRoutineViewController.swift
//  Nuro
//
//  Created by Samuel Dennis on 05/10/22.
//

import UIKit

class ParentRoutineViewController: UIViewController {

    let parentRoutineView = ParentRoutineView()
    let viewModel = ParentRoutineViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parentRoutineView.setup(vc: self)
        viewModel.loadAll(dayId: parentRoutineView.segmentedControl.selectedSegmentIndex+1)
    }
    
    override func loadView() {
        self.view = parentRoutineView
    }
}
