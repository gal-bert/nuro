//
//  ParentActivityListDetailView.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 18/10/22.
//

import UIKit
import SnapKit

class ParentActivityListDetailView: UIView {
    
    let addButton = AddButton()
    let editButton = SmallCapsuleButton(title: "Edit")
    
    var delegate: ParentActivityListDetailDelegate!
    var searchDelegate: SearchControllerDelegate!
    
    let searchController = UISearchController()
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.contentInset = UIEdgeInsets(top: 0, left: 25, bottom: 80, right: 25)
        return view
    }()
    
    func setup(vc: ParentActivityListDetailViewController) {
        backgroundColor = Colors.Neutral.white
        delegate = vc
        collectionView.dataSource = vc
        collectionView.delegate = vc
        collectionView.register(ParentActivityListDetailCollectionViewCell.self, forCellWithReuseIdentifier: ParentActivityListDetailCollectionViewCell.identifier)
        addSubview(collectionView)
        setupNavigationBar(vc: vc)
        setupSearchBar(vc: vc)
        setupConstraints()
    }
    
    func setupNavigationBar(vc: ParentActivityListDetailViewController) {
        
        vc.navigationController?.navigationBar.backgroundColor = Colors.Neutral.white
        //Title Navbar
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.bold, size: 48) ?? UIFont.systemFont(ofSize: 48)]
        
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)
        
        
        vc.navigationItem.setRightBarButtonItems([
            UIBarButtonItem(customView: addButton),
            UIBarButtonItem(customView: editButton)
        ], animated: true)

        vc.navigationItem.hidesSearchBarWhenScrolling = false
        
    }
    
    private func setupSearchBar(vc: ParentActivityListDetailViewController) {
        vc.navigationItem.searchController = searchController
        SearchControllerTemplate(searchController: searchController)
        searchController.searchResultsUpdater = vc
        searchController.searchBar.delegate = vc
        if #available(iOS 16, *){
            vc.navigationItem.preferredSearchBarPlacement = .stacked
        }
    }
    
    @objc private func addButtonAction(vc: ParentActivityListDetailViewController) {
        let dest = CreateActivityViewController()
        dest.category = delegate.getCategory()
        dest.reloadDelegate = vc
        delegate.presentViewController(dest: dest)
    }

    @objc private func editButtonAction() {
        delegate.toggleEditing()
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(23)
            make.left.right.equalTo(self)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
