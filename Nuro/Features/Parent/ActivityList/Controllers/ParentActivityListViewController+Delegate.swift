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

extension UIImage {
    func createImageWithRoundBorder(cornerRadiuos : CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(self.size, false, scale)
        let rect = CGRect(origin:CGPoint(x: 0, y: 0), size: self.size)
        let context = UIGraphicsGetCurrentContext()

        let path = UIBezierPath(
            roundedRect: rect,
            cornerRadius: cornerRadiuos
        )
        context?.beginPath()
        context?.addPath(path.cgPath)
        context?.closePath()
        context?.clip()
        self.draw(at: CGPoint.zero)
        context?.restoreGState()
        path.lineWidth = 1.5
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
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
