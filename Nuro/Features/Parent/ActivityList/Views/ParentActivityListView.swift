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
    
    let searchController = SearchController()
    
    let collectionViewFolder: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    func setup(vc: ParentActivityListViewController) {
        backgroundColor = Colors.Neutral.white
        delegate = vc
        self.vc = vc
        collectionViewFolder.dataSource = vc
        collectionViewFolder.delegate = vc
        collectionViewFolder.register(ParentActivityFolderCollectionViewCell.self, forCellWithReuseIdentifier: ParentActivityFolderCollectionViewCell.identifier)
        addSubview(collectionViewFolder)
        setupNavigationBar()
        searchController.setupSearchController(vc: vc)
        searchController.searchDelegate = vc
        setupConstraints()
        
    }
    
    private func setupNavigationBar() {
        
        vc.navigationController?.navigationBar.barTintColor = Colors.Neutral.white
        //Title Navbar
        vc.title = Strings.parentActivityListTitle
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.bold, size: 48) ?? UIFont.systemFont(ofSize: 48)]
    }
    
    private func setupConstraints() {
        collectionViewFolder.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(23)
            make.left.right.equalTo(self).inset(25)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
    
}
