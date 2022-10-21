//
//  ParentActivityListViewController+Delegate.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 05/10/22.
//

import UIKit

extension ParentActivityListViewController: ParentActivityListDelegate {
    func printText(text: String) {
        viewModel.printText(text: text)
    }
}

extension ParentActivityListViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else {
            return
        }
        print(text)
    }
}

extension ParentActivityListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionViewFolder: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionViewFolder: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewFolder.dequeueReusableCell(withReuseIdentifier: ParentActivityFolderCollectionViewCell.identifier, for: indexPath) as! ParentActivityFolderCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Cell : \(indexPath.row)")
        navigationController?.pushViewController(ParentActivityListDetailViewController(), animated: true)
    }
    
    func collectionView(_ collectionViewFolder: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CollectionViewAttributes.collectionViewFolderCellWidth, height: CollectionViewAttributes.collectionViewFolderCellHeight)
    }
    
    func collectionView(_ collectionViewFolder: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 21
    }
    
    func collectionView(_ collectionViewFolder: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
