//
//  AddActivityRoutimeTimeViewController.swift
//  Nuro
//
//  Created by Samuel Dennis on 30/10/22.
//

import UIKit

class AddActivityRoutimeTimeViewController: UIViewController {

    let addActivityRoutineTimeView = AddActivityRoutineTimeView()
    let addActivityRoutineTimeViewModel = AddActivityRoutineTimeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModalInPresentation = true
        addActivityRoutineTimeView.setup(vc: self)
        
    }
    
    override func loadView() {
        view = addActivityRoutineTimeView
    }

}
