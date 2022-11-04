//
//  ChildActivityCompletedViewController.swift
//  Nuro
//
//  Created by Karen Natalia on 24/10/22.
//

import UIKit

class ChildActivityCompletedViewController: UIViewController {

    private let childActivityCompletedView = ChildActivityCompletedView()
    var activityDesc: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        childActivityCompletedView.setup(vc: self, activityDesc: activityDesc ?? "")
        navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func loadView() {
        self.view = childActivityCompletedView
    }
    
    func setDelegate(reference: ChildRoutineViewController) {
        childActivityCompletedView.animationDelegate = reference
    }
}
