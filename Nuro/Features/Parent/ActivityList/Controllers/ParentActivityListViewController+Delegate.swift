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

extension ParentActivityListViewController: SearchControllerDelegate {
    func filtered(searchText: String) {
        
    }
    
    func getResult(text: String) {
        print("Punya finn: \(text)")
    }
}

extension ParentActivityListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionViewFolder: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categoryActivities.count
    }
    
    func collectionView(_ collectionViewFolder: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionViewFolder.dequeueReusableCell(withReuseIdentifier: ParentActivityFolderCollectionViewCell.identifier, for: indexPath) as! ParentActivityFolderCollectionViewCell
        cell.titleLabel.text = viewModel.categoryActivities[indexPath.item].categoryName
        switch indexPath.item {
        case 0:
            cell.setupColorSet(colorSet: ColorSet.edukasiColor)
            cell.emojiImageView.image = Images.edukasiIcon
        case 1:
            cell.setupColorSet(colorSet: ColorSet.hiburanColor)
            cell.emojiImageView.image = Images.hiburanIcon
        case 2:
            cell.setupColorSet(colorSet: ColorSet.kebersihanDiriColor)
            cell.emojiImageView.image = Images.kebersihanIcon
        case 3:
            cell.setupColorSet(colorSet: ColorSet.olahragaColor)
            cell.emojiImageView.image = Images.olahragaIcon
        case 4:
            cell.setupColorSet(colorSet: ColorSet.peliharaanColor)
            cell.emojiImageView.image = Images.peliharaanIcon
        case 5:
            cell.setupColorSet(colorSet: ColorSet.hariColor)
            cell.emojiImageView.image = Images.sehari2Icon
        case 6:
            cell.setupColorSet(colorSet: ColorSet.tugasRumahColor)
            cell.emojiImageView.image = Images.tugasRumahIcon
        default:
            cell.setupColorSet(colorSet: ColorSet.lainnyaColor)
            cell.emojiImageView.image = Images.lainnyaIcon
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dest = ParentActivityListDetailViewController()
        dest.viewModel.categorySelected = viewModel.categoryActivities[indexPath.item]
        navigationController?.pushViewController(dest, animated: true)
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
