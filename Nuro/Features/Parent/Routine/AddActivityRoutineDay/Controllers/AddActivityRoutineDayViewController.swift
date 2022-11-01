//
//  AddActivityRoutineDayViewController.swift
//  Nuro
//
//  Created by Samuel Dennis on 31/10/22.
//

import UIKit

class AddActivityRoutineDayViewController: UIViewController {

    let addActivityRoutineDayView = AddActivityRoutineDayView()
    let addActivityRoutineDayViewModel = AddActivityRoutineDayViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModalInPresentation = true
        addActivityRoutineDayView.setup(vc: self)
        
    }
    
    override func loadView() {
        view = addActivityRoutineDayView
    }
}
