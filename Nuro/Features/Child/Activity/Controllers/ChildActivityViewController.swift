//
//  ChildActivityViewController.swift
//  Nuro
//
//  Created by Karen Natalia on 26/10/22.
//

import UIKit

class ChildActivityViewController: UIViewController {

    let childActivityView = ChildActivityView()
    var activity: Activity?
    var routineDelegateReference: ChildRoutineViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        childActivityView.setup(model: activity ?? Activity(), vc: self)
        self.navigationItem.setHidesBackButton(true, animated: false)
    }

    override func loadView() {
        self.view = childActivityView
    }
}
