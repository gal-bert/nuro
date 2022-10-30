//
//  ChildPinUnlockViewController.swift
//  Nuro
//
//  Created by Karen Natalia on 27/10/22.
//

import UIKit

class ChildPinUnlockViewController: UIViewController {
    
    private let childPinUnlockView = ChildPinUnlockView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        childPinUnlockView.setup(vc: self)
    }
    
    override func loadView() {
        self.view = childPinUnlockView
    }
}
