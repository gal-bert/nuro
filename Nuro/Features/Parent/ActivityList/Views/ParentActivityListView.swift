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
    
    let tableViewFolder: UITableView = {
        let view = UITableView()
        view.isScrollEnabled = false
        return view
    }()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 50
        return view
    }()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
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
        setupSearchController()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
    }
    
    private func setupNavigationBar() {
        
        vc.navigationController?.navigationBar.backgroundColor = Colors.Neutral.white
        let addButton = AddButton()
        
        //Title Navbar
        vc.title = Strings.parentActivityListTitle
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.bold, size: 48) ?? UIFont.systemFont(ofSize: 48)]
        
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        
        
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        
        //searchController
        
    }
    
    private func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        vc.navigationItem.searchController = searchController
        searchController.searchBar.searchTextField.backgroundColor = Colors.Brand.floralWhite
        searchController.searchBar.barTintColor = Colors.Text.onyx
        searchController.searchBar.placeholder = "Aktivitas, Kegiatan, Pekerjaan Rumah"
        searchController.searchBar.searchTextField.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 22)
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.obscuresBackgroundDuringPresentation = false
        if #available(iOS 16, *){
                    vc.navigationItem.preferredSearchBarPlacement = .stacked
        }
    }
    
    @objc private func addButtonAction() {
        delegate.printText(text: "Add Button Clicked")
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
            make.height.equalTo(15 * CollectionViewAttributes.collectionViewCellHeight)
        }
    }
    
}
