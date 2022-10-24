//
//  ChildStarterViewController.swift
//  Nuro
//
//  Created by Karen Natalia on 24/10/22.
//

import UIKit

class ChildStarterViewController: UIViewController {

    private let childStarterView = ChildStarterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        childStarterView.setup()
    }
    
    override func loadView() {
        self.view = childStarterView
    }

}
