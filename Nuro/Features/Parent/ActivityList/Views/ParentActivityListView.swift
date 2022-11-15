//
//  ViewController.swift
//  Daftar Aktivitas Main
//
//  Created by Finn Christoffer Kurniawan on 04/10/22.
//

import UIKit
import SnapKit

class ParentActivityListView: UIView {
    
    //Delegate Declaration
    var delegate: ParentActivityListDelegate!
    var searchDelegate: SearchControllerDelegate!
    
    //Component Declaration
    let searchController = UISearchController ()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 100, right: 0)
        return view
    }()
    
    //Setup View Function Declaration
    func setup(vc: ParentActivityListViewController) {
        backgroundColor = Colors.Neutral.white
        delegate = vc

        collectionView.dataSource = vc
        collectionView.delegate = vc
        collectionView.register(ParentActivityFolderCollectionViewCell.self, forCellWithReuseIdentifier: ParentActivityFolderCollectionViewCell.identifier)
        collectionView.register(ParentActivityListDetailCollectionViewCell.self, forCellWithReuseIdentifier: ParentActivityListDetailCollectionViewCell.identifier)
        addSubview(collectionView)
        setupNavigationBar(vc: vc)
        setupSearchBar(vc: vc)
        setupConstraints()
        
    }
    
    private func setupNavigationBar(vc: ParentActivityListViewController) {
        vc.navigationController?.navigationBar.barTintColor = Colors.Neutral.white
        vc.title = Strings.parentActivityListTitle
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.bold, size: 48) ?? UIFont.systemFont(ofSize: 48)]
        vc.navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func setupSearchBar(vc: ParentActivityListViewController) {
        vc.navigationItem.searchController = searchController
        SearchControllerTemplate(searchController: searchController)
        searchController.searchResultsUpdater = vc
        searchController.delegate = vc
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
