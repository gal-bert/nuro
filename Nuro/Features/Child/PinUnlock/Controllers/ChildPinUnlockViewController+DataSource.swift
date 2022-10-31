//
//  ChildPinUnlockViewController+DataSource.swift
//  Nuro
//
//  Created by Karen Natalia on 27/10/22.
//

import UIKit

extension ChildPinUnlockViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        11
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PinNumberCollectionViewCell.identifier, for: indexPath) as? PinNumberCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        if indexPath.row <= 8 {
            cell.titleLabel.text = "\(indexPath.row + 1)"
        }
        else if indexPath.row == 10 {
            cell.titleLabel.text = "0"
        }
        else {
            cell.titleLabel.text = ""
            cell.backgroundColor = .clear
            cell.isUserInteractionEnabled = false
        }
        
        return cell
    }
}
