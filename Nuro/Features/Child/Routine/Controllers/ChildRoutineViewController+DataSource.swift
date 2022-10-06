//
//  ChildRoutineViewController+DataSource.swift
//  Nuro
//
//  Created by Karen Natalia on 05/10/22.
//

import UIKit

extension ChildRoutineViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.activityName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ChildActivityCollectionViewCell.identifier, for: indexPath) as! ChildActivityCollectionViewCell
        
        if indexPath.row == 0 && hideFirstActivityCard == true {
            cell.makeHidden()
        }
        else {
            cell.setupValue(activityName: viewModel.activityName[indexPath.row], activityImageName: viewModel.activityImageName[indexPath.row])
        }
        
        return cell
    }
}
