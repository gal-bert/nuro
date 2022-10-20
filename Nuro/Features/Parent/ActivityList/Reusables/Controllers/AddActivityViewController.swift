//
//  AddActivityViewController.swift
//  Nuro
//
//  Created by Gregorius Albert on 20/10/22.
//

import UIKit

class AddActivityViewController: UIViewController {

    let addActivityView = AddActivityView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addActivityView.setup(vc: self)
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        self.view = addActivityView
    }


}
