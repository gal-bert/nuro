//
//  ViewController.swift
//  Daftar Aktivitas Main
//
//  Created by Finn Christoffer Kurniawan on 04/10/22.
//

import UIKit
import SnapKit

extension UIView{
    func addAllSubview(_ views: UIView...){
        for view in views{
            addSubview(view)
        }
    }
}

class ParentActivityListView: UIView, UISearchResultsUpdating {
    
    
    var delegate: ParentActivityListDelegate!
    var vc: ParentActivityListViewController!
    
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
        setupSearchController()
        setupConstraints()
        
    }
    
    private func createWhiteBG(_ frame : CGSize) -> UIImage? {
        var rect = CGRect(x: 0, y: 0, width: 0, height: 0)
        rect.size = frame
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(Colors.Brand.floralWhite.cgColor)
        context?.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
    }
    
    private func setupNavigationBar() {
        
        vc.navigationController?.navigationBar.barTintColor = Colors.Neutral.white
        //Title Navbar
        vc.title = Strings.parentActivityListTitle
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.bold, size: 48) ?? UIFont.systemFont(ofSize: 48)]
        //Setup Button
        let addButton = AddButton()
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(customView: addButton)
        addButton.addTarget(self, action: #selector(addButtonAction), for: .touchUpInside)
    }
    
    private func setupSearchController() {
        let searchController = UISearchController(searchResultsController: nil)
        let size = CGSize(width: searchController.searchBar.frame.size.width-12, height: searchController.searchBar.frame.size.height-12)
        let bgImageSearchBar = createWhiteBG(size)!
        let imageWithCorner = bgImageSearchBar.createImageWithRoundBorder(cornerRadiuos: 10)!
        vc.navigationItem.searchController = searchController
        searchController.searchBar.setSearchFieldBackgroundImage(imageWithCorner, for: UIControl.State.normal)
        searchController.searchBar.searchTextField.textColor = Colors.Text.onyx
        searchController.searchBar.placeholder = "Aktivitas, Kegiatan, Pekerjaan Rumah..."
        searchController.searchBar.searchTextField.font = UIFont(name: Fonts.VisbyRoundCF.regular, size: 20)
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.searchBarStyle = UISearchBar.Style.minimal
        vc.navigationItem.hidesSearchBarWhenScrolling = false
        if #available(iOS 16, *){
            vc.navigationItem.preferredSearchBarPlacement = .stacked
        }
    }
    
    @objc private func addButtonAction() {
        delegate.printText(text: "Add Button Clicked")
    }
    
    private func setupConstraints() {
        collectionViewFolder.snp.makeConstraints { make in
            make.top.bottom.equalTo(safeAreaLayoutGuide).inset(23)
            make.left.right.equalTo(self).inset(25)
            make.height.equalTo(3 * CollectionViewAttributes.collectionViewFolderCellHeight)
        }
    }
    
}
