//
//  ParentTodayActivityViewController.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/10/22.
//

import UIKit

class ParentTodayActivityViewController: UIViewController {
    
    let parentTodayActivityView = ParentTodayActivityView()
    let viewModel = ParentTodayActivityViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        parentTodayActivityView.setup(vc: self)       
    }
    
    override func loadView() {
        self.view = parentTodayActivityView
    }
}
