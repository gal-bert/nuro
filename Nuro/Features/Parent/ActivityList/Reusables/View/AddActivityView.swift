//
//  AddActivityView.swift
//  Nuro
//
//  Created by Gregorius Albert on 20/10/22.
//

import UIKit

class AddActivityView: UIView {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        return view
    }()

    func setup(vc: AddActivityViewController) {
        backgroundColor = .white
        
        collectionView.delegate = vc
        collectionView.dataSource = vc
        collectionView.register(AddActivityButtonCollectionViewCell.self, forCellWithReuseIdentifier: AddActivityButtonCollectionViewCell.identifier)
        collectionView.register(AddActivityContentCollectionViewCell.self, forCellWithReuseIdentifier: AddActivityContentCollectionViewCell.identifier)
        
        
        addSubview(collectionView)
        
        setupNavigationBar(vc: vc)
        setupConstraints()
    }
    
    func setupNavigationBar(vc: AddActivityViewController) {
        vc.title = "Tambah Aktivitas - Pagi"
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.bottom.equalTo(safeAreaLayoutGuide)
            make.left.right.equalTo(self).inset(15)
        }
    }
    
    // TODO: Setup Search Bar Controller
    
}
