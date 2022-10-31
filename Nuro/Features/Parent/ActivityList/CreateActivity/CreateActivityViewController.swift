//
//  CreateActivityViewController.swift
//  Nuro
//
//  Created by Gregorius Albert on 31/10/22.
//

import UIKit

class CreateActivityViewController: UIViewController {
    
    let createActivityView = CreateActivityView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createActivityView.setup(vc: self)
    }

    override func loadView() {
        view = createActivityView
    }
    


}
