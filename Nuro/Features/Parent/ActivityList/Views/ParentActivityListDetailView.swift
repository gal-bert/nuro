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
    var vc: ParentActivityListDetailViewController!
    
    let searchController = SearchController()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    func setup(vc: ParentActivityListDetailViewController) {
        backgroundColor = Colors.Neutral.white
        delegate = vc
        self.vc = vc
        collectionView.dataSource = vc
        collectionView.delegate = vc
        collectionView.register(ParentActivityListDetailCollectionViewCell.self, forCellWithReuseIdentifier: ParentActivityListDetailCollectionViewCell.identifier)
        addSubview(collectionView)
        searchController.setupSearchController(vc: vc)
        self.setupNavigationBar()
        setupConstraints()
    }
    
    func setupNavigationBar() {
        
        vc.navigationController?.navigationBar.backgroundColor = Colors.Neutral.white
        //Title Navbar
//        vc.title = "Judul Jenis Aktivitas"
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.bold, size: 48) ?? UIFont.systemFont(ofSize: 48)]
        
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)
        
        vc.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: addButton),
            vc.editButtonItem
            ]
    }
    
    @objc private func addButtonAction() {
        let dest = CreateActivityViewController()
        dest.category = delegate.getCategory()
        dest.delegate = vc
        delegate.presentViewController(dest: dest)
    }

    @objc private func editButtonAction() {
        //belum tau mau diapain
    }
    
    private func setupConstraints() {
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(23)
            make.left.right.equalTo(self).inset(25)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
