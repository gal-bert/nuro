//
//  ParentRoutineAddActivityViewController.swift
//  Nuro
//
//  Created by Samuel Dennis on 24/10/22.
//

import UIKit

class ParentRoutineAddActivityViewController: UIViewController {
    
    let parentRoutineAddActivityView = ParentRoutineAddActivityView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModalInPresentation = true
        parentRoutineAddActivityView.setup(vc: self)
        
    }
    
    override func loadView() {
        view = parentRoutineAddActivityView
    }

}
