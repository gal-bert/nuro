//
//  ParentActivityListViewController.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 05/10/22.
//

import UIKit

class ParentActivityListViewController: UIViewController {
    
    let parentActivityListView = ParentActivityListView()
    let viewModel = ParentActivityListViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        parentActivityListView.setup(vc: self)
    }
    
    override func loadView() {
        self.view = parentActivityListView
    }

}
