//
//  ParentActivityListDetailViewController+Delegate.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 18/10/22.
//

import UIKit

extension ParentActivityListDetailViewController: ParentActivityListDetailDelegate {
    func toggleEditing() {
        if parentActivityListDetailView.collectionView.isEditing == true {
            setEditing(false, animated: true)
            parentActivityListDetailView.collectionView.isEditing = false
            parentActivityListDetailView.editButton.setTitle("Edit", for: .normal)
            parentActivityListDetailView.editButton.frame.size.width = 60

            // Clear all animation
            parentActivityListDetailView.collectionView.indexPathsForVisibleItems.forEach { (indexPath) in
                let cell = parentActivityListDetailView.collectionView.cellForItem(at: indexPath) as! ParentActivityListDetailCollectionViewCell
                cell.layer.removeAllAnimations()
            }

        } else {
            setEditing(true, animated: true)

            // Create wobble animation
            let wobble = CAKeyframeAnimation(keyPath: "transform.rotation")
            wobble.values = [0.0, -0.025, 0.0, 0.025, 0.0]
            wobble.keyTimes = [0.0, 0.25, 0.5, 0.75, 1.0]
            wobble.duration = 0.4
            wobble.isAdditive = true
            wobble.repeatCount = Float.greatestFiniteMagnitude

            // add wobble animation to each collection view cell
            parentActivityListDetailView.collectionView.indexPathsForVisibleItems.forEach { (indexPath) in
                let cell = parentActivityListDetailView.collectionView.cellForItem(at: indexPath) as! ParentActivityListDetailCollectionViewCell
                cell.layer.add(wobble, forKey: "wobble")
            }

            parentActivityListDetailView.collectionView.isEditing = true
            parentActivityListDetailView.editButton.setTitle("Selesai", for: .normal)
            parentActivityListDetailView.editButton.frame.size.width = 80
        }
    }

    func getCategory() -> Category {
        return viewModel.categorySelected ?? Category()
    }
    
    func presentViewController(dest: UIViewController) {
        let vc = UINavigationController(rootViewController: dest)
        vc.isModalInPresentation = true
        vc.modalPresentationStyle = .formSheet
        vc.preferredContentSize = .init(width: ScreenSizes.modalWidth, height: ScreenSizes.modalHeight)        
        present(vc, animated: true)
    }
    
    func dismissViewController() {
        parentActivityListDetailView.collectionView.reloadData()
        dismiss(animated: true)
    }
}


extension ParentActivityListDetailViewController: ReloadDelegate {
    func reloadView() {
        viewModel.loadAllActivity()
        parentActivityListDetailView.collectionView.reloadData()
    }
}


extension ParentActivityListDetailViewController: UISearchResultsUpdating, UISearchBarDelegate, UISearchControllerDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = parentActivityListDetailView.searchController.searchBar.text
        viewModel.filteredActivities = viewModel.activityList.filter {
            if(searchText != ""){
                let searchTextMatch = $0.activityName?.lowercased().contains((searchText?.lowercased())!)
                return searchTextMatch ?? false
            }
            else{
                return true
            }
        }
        parentActivityListDetailView.collectionView.reloadData()
    }
    func didDismissSearchController(_ searchController: UISearchController) {
        parentActivityListDetailView.collectionView.reloadData()
    }
}


extension ParentActivityListDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filteredActivities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ParentActivityListDetailCollectionViewCell.identifier, for: indexPath) as! ParentActivityListDetailCollectionViewCell
        let selectedActivity = viewModel.filteredActivities[indexPath.row]
        cell.titleLabel.text = selectedActivity.activityName
        cell.imageView.image = Document.getImageFromDocument(imageURL: selectedActivity.activityImageURL)
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dest = CreateActivityViewController()
        dest.activity = viewModel.filteredActivities[indexPath.item]
        dest.category = viewModel.categorySelected
        dest.reloadDelegate = self
        presentViewController(dest: dest)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CollectionViewAttributes.smallCollectionViewCellWidth, height: CollectionViewAttributes.smallCollectionViewCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 16
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}

extension ParentActivityListDetailViewController: DeleteDataCollectionProtocol {
    func deleteData(indx: Int) {

        let alert = Alert.destructiveAlert(title: "", message: "Apakah anda ingin menghapus \"\(viewModel.filteredActivities[indx].activityName ?? "")\" dari rutinitas ini?") {
            ActivityLocalRepository.shared.delete(activity: self.viewModel.activityList[indx])
            self.viewModel.loadAllActivity()
            self.parentActivityListDetailView.collectionView.reloadData()
            self.dismissViewController()
        }
        present(alert, animated: true)
    }
}
