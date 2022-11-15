//
//  ParentChildRoutineViewController.swift
//  Nuro
//
//  Created by Karen Natalia on 17/10/22.
//

import UIKit

class ParentChildRoutineViewController: UIViewController {

    private let parentChildRoutineView = ParentChildRoutineView()
    let viewModel = ParentChildRoutineViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getTodaysRoutine()
        parentChildRoutineView.setup(vc: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getTodaysRoutine()
        parentChildRoutineView.routineTableView.reloadData()
        (
            parentChildRoutineView.routineTableView.cellForRow(at: IndexPath(row: 0, section: 0)) as? ParentTodayActivityTableViewCell
        )?.collectionView.reloadData()
    }
    
    override func loadView() {
        self.view = parentChildRoutineView
    }
    
}
