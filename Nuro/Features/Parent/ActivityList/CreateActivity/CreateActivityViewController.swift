//
//  CreateActivityViewController.swift
//  Nuro
//
//  Created by Gregorius Albert on 31/10/22.
//

import UIKit

class CreateActivityViewController: UIViewController {
    
    let createActivityView = CreateActivityView()
    var category: Category?
    
    var delegate: ReloadCreateActivity?
    var addActivityDelegate: AddActivityToRoutineDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createActivityView.setup(vc: self)
    }

    override func loadView() {
        view = createActivityView
    }
    


}
