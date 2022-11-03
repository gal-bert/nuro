//
//  AddActivityView.swift
//  Nuro
//
//  Created by Gregorius Albert on 20/10/22.
//

import UIKit

class AddActivityView: UIView {
    
    var delegate: AddActivityDelegate!
    
    lazy var segmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(items: ["Semua"])
        view.selectedSegmentIndex = 0
        return view
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        return view
    }()
    
    let searchController = SearchController()

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
        searchController.setupSearchController(vc: vc)
        searchController.searchDelegate = vc

        setupConstraints()
    }
    
    func setupNavigationBar(vc: AddActivityViewController) {
        vc.title = "Tambah Aktivitas - Pagi"
    }
    
    private func setupConstraints() {
        
        segmentedControl.snp.makeConstraints { make in
            make.top.left.right.equalTo(safeAreaLayoutGuide).inset(20)
        }
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(20)
            make.left.right.equalTo(safeAreaLayoutGuide).inset(15)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }

    @objc func selectedSegmentChanged() {
        delegate.filterCategory()
    }

    
}
