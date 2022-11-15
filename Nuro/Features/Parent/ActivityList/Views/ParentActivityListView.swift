//
//  ViewController.swift
//  Daftar Aktivitas Main
//
//  Created by Finn Christoffer Kurniawan on 04/10/22.
//

import UIKit
import SnapKit

class ParentActivityListView: UIView {
    
    var delegate: ParentActivityListDelegate!
    var vc: ParentActivityListViewController!
    
    let searchController = UISearchController ()
    
    var searchDelegate: SearchControllerDelegate!
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 100, right: 0)
        return view
    }()
    
    func setup(vc: ParentActivityListViewController) {
        backgroundColor = Colors.Neutral.white
        delegate = vc
        self.vc = vc
        collectionView.dataSource = vc
        collectionView.delegate = vc
        collectionView.register(ParentActivityFolderCollectionViewCell.self, forCellWithReuseIdentifier: ParentActivityFolderCollectionViewCell.identifier)
        collectionView.register(ParentActivityListDetailCollectionViewCell.self, forCellWithReuseIdentifier: ParentActivityListDetailCollectionViewCell.identifier)
        addSubview(collectionView)
        setupNavigationBar()
        setupSearchBar()
        setupConstraints()
        
    }
    
    private func setupNavigationBar() {
        
        vc.navigationController?.navigationBar.barTintColor = Colors.Neutral.white
        //Title Navbar
        vc.title = Strings.parentActivityListTitle
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.bold, size: 48) ?? UIFont.systemFont(ofSize: 48)]
        vc.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setupSearchBar() {
        vc.navigationItem.searchController = searchController
        SearchControllerTemplate(searchController: searchController)
        searchController.searchResultsUpdater = vc
        searchController.searchBar.delegate = vc
        if #available(iOS 16, *){
            vc.navigationItem.preferredSearchBarPlacement = .stacked
        }
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.left.right.equalTo(self).inset(25)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
}
