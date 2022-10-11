//
//  ViewController.swift
//  Daftar Aktivitas Main
//
//  Created by Finn Christoffer Kurniawan on 04/10/22.
//

import UIKit
import SnapKit

class ParentActivityListView: UIView, UISearchResultsUpdating {
    
    let tableViewFolder: UITableView = {
        let view = UITableView()
        view.isScrollEnabled = false
        return view
    }()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 100
        return view
    }()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .green
        return view
    }()
    
    var delegate: ParentActivityListDelegate!
    
    var vc: ParentActivityListViewController!
    
    func setup(vc: ParentActivityListViewController) {
        delegate = vc
        self.vc = vc
        tableViewFolder.dataSource = vc
        tableViewFolder.delegate = vc
        tableViewFolder.register(ParentActivityFolderTableViewCell.self, forCellReuseIdentifier: ParentActivityFolderTableViewCell.identifier)
        
        backgroundColor = .white
        
        setupNavigationBar()
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(tableViewFolder)
        setupConstraints()
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
        vc.title = "Daftar Aktivitas"
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        
        let moreButton = MoreButton()
        let pilihButton = SmallCapsuleButton(title: "Pilih")
        
        vc.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: moreButton),
            UIBarButtonItem(customView: pilihButton)
        ]
        
        moreButton.addTarget(self, action: #selector(moreButtonAction), for: .touchUpInside)
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
    

    
    @objc private func pilihButtonAction() {
        delegate.printText(text: "Select Button Clicked")
    }
    
    @objc private func moreButtonAction() {
        delegate.printText(text: "More Button Clicked")
    }
    
    private func setupConstraints() {
        
        scrollView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(safeAreaLayoutGuide)
        }
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(scrollView).inset(20)
            make.width.equalTo(scrollView.snp.width).inset(20)
        }
        
        tableViewFolder.snp.makeConstraints { make in
            make.height.equalTo(15 * CollectionViewAttributes.COLLECTION_VIEW_CELL_HEIGHT)
        }
    }
    
}
