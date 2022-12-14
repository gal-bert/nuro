//
//  ChildRoutineViewController+DataSource.swift
//  Nuro
//
//  Created by Karen Natalia on 05/10/22.
//

import UIKit

extension ChildRoutineViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.activities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChildActivityCollectionViewCell.identifier, for: indexPath) as? ChildActivityCollectionViewCell else { return ChildActivityCollectionViewCell() }
        
        if indexPath.row == 0 && isFirstActivityCardHidden == true {
            cell.makeHidden()
        }
        else {
            cell.configure(model: viewModel.activities[indexPath.row].activity ?? Activity())
        }
        
        return cell
    }
}
