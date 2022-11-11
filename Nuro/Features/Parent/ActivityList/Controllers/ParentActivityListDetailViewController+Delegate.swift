//
//  ParentActivityListDetailViewController+Delegate.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 18/10/22.
//

import UIKit

extension ParentActivityListDetailViewController: ParentActivityListDetailDelegate, ReloadCreateActivity {
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
    
    func reloadData() {
        viewModel.loadAllActivity()
        parentActivityListDetailView.collectionView.reloadData()
    }
    
    func dismissViewController() {
        parentActivityListDetailView.collectionView.reloadData()
        dismiss(animated: true)
    }
}

extension ParentActivityListDetailViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.listActivities.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ParentActivityListDetailCollectionViewCell.identifier, for: indexPath) as! ParentActivityListDetailCollectionViewCell
        cell.titleLabel.text = viewModel.listActivities[indexPath.row].activityName
        cell.imageView.image = Document.getImageFromDocument(imageURL: viewModel.listActivities[indexPath.row].activityImageURL)
        cell.index = indexPath
        cell.delegate = self
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dest = CreateActivityViewController()
        dest.activity = viewModel.listActivities[indexPath.item]
        dest.category = viewModel.categorySelected
        dest.delegate = self
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

        let alert = Alert.destructiveAlert(title: "", message: "Apakah anda ingin menghapus { } dari Daftar Aktivitas?") {
            ActivityLocalRepository.shared.delete(activity: self.viewModel.listActivities[indx])
            self.viewModel.loadAllActivity()
            self.parentActivityListDetailView.collectionView.reloadData()
            self.dismissViewController()
        }
        present(alert, animated: true)
    }
}
