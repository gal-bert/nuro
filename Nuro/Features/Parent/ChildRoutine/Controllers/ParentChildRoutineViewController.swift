//
//  ParentChildRoutineViewController.swift
//  Nuro
//
//  Created by Karen Natalia on 17/10/22.
//

import UIKit

class ParentChildRoutineViewController: UIViewController {

    private let parentChildRoutineView = ParentChildRoutineView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        parentChildRoutineView.setup(vc: self)
    }
    
    override func loadView() {
        self.view = parentChildRoutineView
    }
    
}
