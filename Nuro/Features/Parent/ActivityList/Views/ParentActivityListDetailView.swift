//
//  ParentActivityListDetailView.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 18/10/22.
//

import UIKit
import SnapKit

class ParentActivityListDetailView: UIView {
    
    var delegate: ParentActivityListDetailDelegate!
    var vc: ParentActivityListDetailViewController!
    
    let editButton = SmallCapsuleButton(title: "Edit")
    
    let searchController = SearchController()
    
    let collectionViewListDetail: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return view
    }()
    
    func setup(vc: ParentActivityListDetailViewController) {
        backgroundColor = Colors.Neutral.white
        delegate = vc
        self.vc = vc
        collectionViewListDetail.dataSource = vc
        collectionViewListDetail.delegate = vc
        collectionViewListDetail.register(AddActivityContentCollectionViewCell.self, forCellWithReuseIdentifier: AddActivityContentCollectionViewCell.identifier)
        addSubview(collectionViewListDetail)
        searchController.setupSearchController(vc: vc)
        setupNavigationBar()
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        
        vc.navigationController?.navigationBar.backgroundColor = Colors.Neutral.white
        //Title Navbar
        vc.title = "Judul Jenis Aktivitas"
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.bold, size: 48) ?? UIFont.systemFont(ofSize: 48)]
        //Setup AddButton
        let addButton = AddButton()
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
        //Setup EditButton
        editButton.addTarget(self, action: #selector(editButtonAction), for: .touchUpInside)
        
        vc.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: addButton),
            UIBarButtonItem(customView: editButton)
            ]
    }
    
    @objc private func addButtonAction() {
//        delegate.printText(text: "Add Button Clicked")
        delegate.presentViewController(dest: CreateActivityViewController())
    }
    
    @objc private func editButtonAction() {
        
    }
    
    private func setupConstraints() {
        collectionViewListDetail.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(23)
            make.left.right.equalTo(self).inset(25)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
