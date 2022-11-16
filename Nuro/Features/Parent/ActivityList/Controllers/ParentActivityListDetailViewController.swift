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
    var editButton = SmallCapsuleButton(title: "Edit")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parentActivityListDetailView.setup(vc: self)
        viewModel.loadAllActivity()
        title = viewModel.categorySelected?.categoryName
        
        
        editButton.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)
        
        let addButton = AddButton()
        
        navigationItem.setRightBarButtonItems([
            UIBarButtonItem(customView: addButton),
            UIBarButtonItem(customView: editButton)
        ], animated: true)
        
    }
    
    override func loadView() {
        self.view = parentActivityListDetailView
    }
    
    @objc func callSetEdit() {
        setEditing(true, animated: true)
    }
    
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        parentActivityListDetailView.collectionView.indexPathsForVisibleItems.forEach { (indexPath) in
            let cell = parentActivityListDetailView.collectionView.cellForItem(at: indexPath) as! ParentActivityListDetailCollectionViewCell
            cell.isEditing = editing
        }
    }
    
    
    @objc func editButtonAction() {
        
        if parentActivityListDetailView.collectionView.isEditing == true {
            setEditing(false, animated: true)
            parentActivityListDetailView.collectionView.isEditing = false
            editButton.setTitle("Edit", for: .normal)
            editButton.frame.size.width = 60
        } else {
            setEditing(true, animated: true)
            parentActivityListDetailView.collectionView.isEditing = true
            editButton.setTitle("Selesai", for: .normal)
            editButton.frame.size.width = 80
        }
    }
}
