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
//    let searchController = SearchController()

    override func viewDidLoad() {
        super.viewDidLoad()
        parentActivityListView.setup(vc: self)
        viewModel.loadAllCategory()
//        searchController.setupSearchController(vc: self)
//        parentActivityListView.searchController.searchResultsUpdater = self
    }
    
    override func loadView() {
        self.view = parentActivityListView
    }

}
