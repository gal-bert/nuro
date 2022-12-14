//
//  AddActivityView.swift
//  Nuro
//
//  Created by Gregorius Albert on 20/10/22.
//

import UIKit

class AddActivityView: UIView {
    
    var delegate: AddActivityDelegate!
    
    let searchController = UISearchController ()
    var searchDelegate: SearchControllerDelegate!
    
    lazy var segmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(items: ["Semua"])
        view.selectedSegmentIndex = 0
        
        let selectedTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.bold, size: 16)]
        let normalTextAttributes = [ NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.regular, size: 16)]
        view.setTitleTextAttributes(selectedTextAttributes as [NSAttributedString.Key : Any], for: .selected)
        view.setTitleTextAttributes(normalTextAttributes as [NSAttributedString.Key : Any], for: .normal)
        view.selectedSegmentTintColor = Colors.Brand.blueViolet
        
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        return view
    }()

    func setup(vc: AddActivityViewController) {
        backgroundColor = .white
        delegate = vc
        
        collectionView.delegate = vc
        collectionView.dataSource = vc
        collectionView.register(AddActivityButtonCollectionViewCell.self, forCellWithReuseIdentifier: AddActivityButtonCollectionViewCell.identifier)
        collectionView.register(AddActivityContentCollectionViewCell.self, forCellWithReuseIdentifier: AddActivityContentCollectionViewCell.identifier)
        addMultipleSubviews(views: segmentedControl, collectionView)
        segmentedControl.addTarget(self, action: #selector(selectedSegmentChanged), for: .valueChanged)

        setupNavigationBar(vc: vc)
        setupSearchBar(vc: vc)
        vc.navigationItem.hidesSearchBarWhenScrolling = false
        setupConstraints()
    }
    
    func setupNavigationBar(vc: AddActivityViewController) {
        vc.title = "Pilih Aktivitas"
    }
    
    private func setupSearchBar(vc: AddActivityViewController) {
        vc.navigationItem.searchController = searchController
        SearchControllerTemplate(searchController: searchController)
        searchController.searchResultsUpdater = vc
        searchController.delegate = vc
        if #available(iOS 16, *){
            vc.navigationItem.preferredSearchBarPlacement = .stacked
        }
    }
    
    private func setupConstraints() {
        
        segmentedControl.snp.makeConstraints { make in
            make.top.left.right.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(40)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            make.left.right.equalTo(self).inset(15)
            make.bottom.equalTo(self)
        }
    }

    @objc func selectedSegmentChanged() {
        delegate.filterCategory()
    }

    
}
