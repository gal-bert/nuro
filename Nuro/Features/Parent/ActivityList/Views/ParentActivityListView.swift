//
//  ViewController.swift
//  Daftar Aktivitas Main
//
//  Created by Finn Christoffer Kurniawan on 04/10/22.
//

import UIKit
import SnapKit

class ParentActivityListView: UIView, UISearchResultsUpdating {
    
    var delegate: ParentActivityListDelegate!
    
    var vc: ParentActivityListViewController!
    
    func setup(vc: ParentActivityListViewController) {
        delegate = vc
        self.vc = vc
        
        backgroundColor = .white
        
        setupNavigationBar()
        //setupButtonView()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
    }
    
    private func setupNavigationBar() {
        
        //Title Navbar
        vc.title = Strings.parentActivityListTitle
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        
        let addButton = AddButton()
        let pilihButton = SmallCapsuleButton(title: "Pilih")
        
        vc.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: addButton),
            UIBarButtonItem(customView: pilihButton)
        ]
        
        addButton.addTarget(self, action: #selector(moreButtonAction), for: .touchUpInside)
        pilihButton.addTarget(self, action: #selector(pilihButtonAction), for: .touchUpInside)
        
        //searchController
        let searchController = UISearchController(searchResultsController: nil)
        vc.navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.obscuresBackgroundDuringPresentation = false
        if #available(iOS 16, *){
                    vc.navigationItem.preferredSearchBarPlacement = .stacked
        }
    }
    
//    private func setupButtonView() {
//        //
//        let searchController = UISearchController(searchResultsController: nil)
//        searchController.obscuresBackgroundDuringPresentation = false
//        searchController.definesPresentationContext = true
//        vc.navigationItem.searchController = searchController
//
//    }
    
    @objc private func pilihButtonAction() {
        delegate.printText(text: "Select Button Clicked")
    }
    
    @objc private func moreButtonAction() {
        delegate.printText(text: "More Button Clicked")
    }
    
    private func setupConstraints() {
        
    }
    
}
