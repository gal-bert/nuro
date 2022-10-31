//
//  ParentActivityListDetailViewController+Delegate.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 18/10/22.
//

import UIKit

extension ParentActivityListDetailViewController: ParentActivityListDetailDelegate {
    func presentViewController(dest: UIViewController) {
        let vc = UINavigationController(rootViewController: dest)
        vc.isModalInPresentation = true
        vc.modalPresentationStyle = .formSheet
        vc.preferredContentSize = .init(width: ScreenSizes.modalWidth, height: ScreenSizes.modalHeight)
        present(vc, animated: true)
    }
    
}

extension ParentActivityListDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddActivityContentCollectionViewCell.identifier, for: indexPath) as! AddActivityContentCollectionViewCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Cell : \(indexPath.row)")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CollectionViewAttributes.smallCollectionViewCellWidth, height: CollectionViewAttributes.smallCollectionViewCellHeight)
    }
    
    func collectionView(_ collectionViewFolder: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionViewFolder: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
