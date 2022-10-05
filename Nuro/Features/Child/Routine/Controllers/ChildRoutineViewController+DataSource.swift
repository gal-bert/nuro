//
//  ChildRoutineViewController+DataSource.swift
//  Nuro
//
//  Created by Karen Natalia on 05/10/22.
//

import UIKit

extension ChildRoutineViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        activityName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "childActivityCell", for: indexPath) as! ChildActivityCollectionViewCell
        
        cell.setupValue(activityName: activityName[indexPath.row], activityImageName: activityImageName[indexPath.row])
        
        return cell
    }
}
