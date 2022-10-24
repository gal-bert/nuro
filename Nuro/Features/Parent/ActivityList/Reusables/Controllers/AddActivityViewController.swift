//
//  AddActivityViewController.swift
//  Nuro
//
//  Created by Gregorius Albert on 20/10/22.
//

import UIKit
import RxSwift
import RxDataSources
import RxCocoa

class AddActivityViewController: UIViewController {

    let addActivityView = AddActivityView()
    let viewModel = AddActivityViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferredContentSize = .init(width: ScreenSizes.modalWidth, height: ScreenSizes.modalHeight)

        addActivityView.setup(vc: self)
        addActivityView.searchController.searchResultsUpdater = self
        
        viewModel.loadSegmentedControlItems(vc: self)
        
        viewModel.activities.bind(to: addActivityView.collectionView.rx.items(
            cellIdentifier: AddActivityContentCollectionViewCell.identifier,
            cellType: AddActivityContentCollectionViewCell.self
        )) { index, model, cell in
            cell.titleLabel.text = model.activityName
        }
        .disposed(by: disposeBag)
        
        
        addActivityView.collectionView.rx.modelSelected(Activity.self).subscribe(onNext: { item in
            print("Selected item \(item.activityName)")
        }).disposed(by: disposeBag)
        
        viewModel.loadAllActivities()
        
        
    }
    
    override func loadView() {
        self.view = addActivityView
    }


}
