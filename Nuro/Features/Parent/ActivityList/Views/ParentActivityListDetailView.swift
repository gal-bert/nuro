//
//  ParentActivityListDetailView.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 18/10/22.
//

import UIKit
import SnapKit

class ParentActivityListDetailView: UIView {
    
    var delegate: ParentActivityListDetailDelegate!
    var vc: ParentActivityListDetailViewController!
    
    func setup(vc: ParentActivityListDetailViewController) {
        backgroundColor = Colors.Neutral.white
        delegate = vc
        self.vc = vc
//        collectionViewFolder.dataSource = vc
//        collectionViewFolder.delegate = vc
//        collectionViewFolder.register(ParentActivityFolderCollectionViewCell.self, forCellWithReuseIdentifier: ParentActivityFolderCollectionViewCell.identifier)
//        addSubview(collectionViewFolder)
//        setupNavigationBar()
//        setupConstraints()
    }
    
    private func setupNavigationBar() {
        
        vc.navigationController?.navigationBar.backgroundColor = Colors.Neutral.white
        //Title Navbar
        vc.title = Strings.parentActivityListTitle
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.bold, size: 48) ?? UIFont.systemFont(ofSize: 48)]
        //Setup AddButton
        let addButton = AddButton()
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        //Setup EditButton
        let editButton = SmallCapsuleButton()
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: editButton)
        editButton.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)
        
    }
    
//    private func setupSearchController() {
//        let searchController = UISearchController(searchResultsController: nil)
//        vc.navigationItem.searchController = searchController
//        searchController.searchBar.searchTextField.backgroundColor = Colors.Brand.floralWhite
//        searchController.searchBar.barTintColor = Colors.Text.onyx
//        searchController.searchBar.placeholder = "Aktivitas, Kegiatan, Pekerjaan Rumah"
//        searchController.searchBar.searchTextField.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 22)
//        searchController.searchResultsUpdater = self
//        searchController.searchBar.autocapitalizationType = .none
//        searchController.obscuresBackgroundDuringPresentation = false
//        if #available(iOS 16, *){
//            vc.navigationItem.preferredSearchBarPlacement = .stacked
//        }
//    }
    
    @objc private func addButtonAction() {
        delegate.printText(text: "Add Button Clicked")
    }
    
    @objc private func editButtonAction() {
        delegate.printText(text: "Edit Button Clicked")
    }
}
