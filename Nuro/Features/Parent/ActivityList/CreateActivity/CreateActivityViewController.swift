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
    var activity: Activity?
    
    var reloadDelegate: ReloadDelegate?
    var addActivityDelegate: AddActivityToRoutineDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createActivityView.setup(vc: self)
        if let model = activity {
            createActivityView.setupForEditMode(activity: model, vc: self)
        }
    }

    override func loadView() {
        view = createActivityView
    }
    


}
