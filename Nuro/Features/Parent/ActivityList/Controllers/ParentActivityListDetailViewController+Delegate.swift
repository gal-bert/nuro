//
//  ParentActivityListDetailViewController+Delegate.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 18/10/22.
//

import UIKit

extension ParentActivityListDetailViewController: ParentActivityListDetailDelegate {
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
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        parentActivityListDetailView.collectionView.reloadData()
    }
}
extension ParentActivityListDetailViewController: SearchControllerDelegate {
    func getResult(text: String) {
        print("Punya finn Detail: \(text)")
        filtered(searchText: text)
    }
    func filtered(searchText: String) {
        viewModel.filteredActivities = viewModel.activityList.filter {
            if(searchText != ""){
                let searchTextMatch = $0.activityName?.lowercased().contains(searchText.lowercased())
                return searchTextMatch ?? false
            }
            else{
                viewModel.filteredActivities = viewModel.activityList
                parentActivityListDetailView.collectionView.reloadData()
                return true
            }
        }
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
