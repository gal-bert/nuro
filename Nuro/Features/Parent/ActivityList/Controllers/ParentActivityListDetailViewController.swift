//
//  ParentActivityListDetailViewController.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 18/10/22.
//

import UIKit

class ParentActivityListDetailViewController: UIViewController {
    
    var listArray = [Activity]()
    
    let parentActivityListDetailView = ParentActivityListDetailView()
    let viewModel = ParentActivityListDetailViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parentActivityListDetailView.setup(vc: self)
//        navigationItem.rightBarButtonItem = editButtonItem
        viewModel.loadAllActivity()
    }
    
    override func loadView() {
        self.view = parentActivityListDetailView
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        parentActivityListDetailView.collectionView.indexPathsForVisibleItems.forEach { (indexPath) in
            let cell = parentActivityListDetailView.collectionView.cellForItem(at: indexPath) as! ParentActivityListDetailCollectionViewCell
            cell.isEditing = editing
        }
    }
}
