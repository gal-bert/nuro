//
//  ChildActivityCompletedViewController.swift
//  Nuro
//
//  Created by Karen Natalia on 24/10/22.
//

import UIKit

class ChildActivityCompletedViewController: UIViewController {

    private let childActivityCompletedView = ChildActivityCompletedView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        childActivityCompletedView.setup()
    }
    
    override func loadView() {
        self.view = childActivityCompletedView
    }
}
