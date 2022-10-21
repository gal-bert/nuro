//
//  ParentActivityListDetailViewController.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 18/10/22.
//

import UIKit

class ParentActivityListDetailViewController: UIViewController {
    
    let parentActivityListDetailView = ParentActivityListDetailView()
    let viewModel = ParentActivityListDetailViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        parentActivityListDetailView.setup(vc: self)
    }
    
    override func loadView() {
        self.view = parentActivityListDetailView
    }

}
