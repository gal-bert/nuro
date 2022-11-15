//
//  AddActivityViewController+Delegate.swift
//  Nuro
//
//  Created by Gregorius Albert on 20/10/22.
//

import UIKit
import RxSwift
import RxCocoa
import RxDataSources

extension AddActivityViewController: AddActivityDelegate {
    func updateSearchResults(text: String) {
        print("SEARCH: \(text)")
    }

    func filterCategory() {
        if addActivityView.segmentedControl.selectedSegmentIndex > 0 {
            viewModel.filteredActivities = viewModel.activities.filter {
                $0.category?.categoryName?.contains(addActivityView.segmentedControl.titleForSegment(at: addActivityView.segmentedControl.selectedSegmentIndex) ?? "") ?? true
            }
        } else {
            viewModel.filteredActivities = viewModel.activities
        }
        addActivityView.collectionView.reloadData()
    }
}

extension AddActivityViewController: UISearchResultsUpdating, UISearchControllerDelegate{
    func updateSearchResults(for searchController: UISearchController) {
        let searchText = addActivityView.searchController.searchBar.text
        viewModel.filteredActivities = viewModel.activities.filter {
            if(searchText != ""){
                let searchTextMatch = $0.activityName?.lowercased().contains((searchText?.lowercased())!)
                return searchTextMatch ?? false
            }
            else{
                return true
            }
        }
        addActivityView.collectionView.reloadData()
    }

    func didDismissSearchController(_ searchController: UISearchController) {
        addActivityView.collectionView.reloadData()
        addActivityView.segmentedControl.isEnabled = true
    }
    
    func didPresentSearchController(_ searchController: UISearchController) {
        addActivityView.segmentedControl.selectedSegmentIndex = 0
        addActivityView.collectionView.reloadData()
        addActivityView.segmentedControl.isEnabled = false
    }
}

extension AddActivityViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

    if addActivityView.segmentedControl.selectedSegmentIndex > 0, indexPath.item == 0 {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddActivityButtonCollectionViewCell.identifier, for: indexPath) as! AddActivityButtonCollectionViewCell
        return cell
    }
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AddActivityContentCollectionViewCell.identifier, for: indexPath) as! AddActivityContentCollectionViewCell
    cell.titleLabel.text = viewModel.filteredActivities[indexPath.item].activityName
    cell.imageView.image = Document.getImageFromDocument(imageURL: viewModel.filteredActivities[indexPath.item].activityImageURL)
    return cell
    
}

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.filteredActivities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if addActivityView.segmentedControl.selectedSegmentIndex > 0, indexPath.row == 0 {
            let dest = CreateActivityViewController()
            dest.addActivityDelegate = self.delegate
            dest.category = viewModel.getSelectedCategory(selectedIndex: addActivityView.segmentedControl.selectedSegmentIndex - 1)
            navigationController?.pushViewController(dest, animated: true)
        }
        else {
            delegate?.addActivityToRoutine(activity: viewModel.filteredActivities[indexPath.item])
            navigationController?.popViewController(animated: true)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CollectionViewAttributes.smallCollectionViewCellWidth, height: CollectionViewAttributes.smallCollectionViewCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 0, bottom: 80, right: 0)
    }
    
}
