//
//  ParentChildRoutineViewController.swift
//  Nuro
//
//  Created by Karen Natalia on 17/10/22.
//

import UIKit

class ParentChildRoutineViewController: UIViewController {

    let parentChildRoutineView = ParentChildRoutineView()
    let viewModel = ParentChildRoutineViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.getTodaysRoutine()
        parentChildRoutineView.setup(vc: self)
        
        if viewModel.todaysRoutines.count == 0 {
            parentChildRoutineView.emptyState.isHidden = false
            parentChildRoutineView.routineTableView.alpha = 0
            parentChildRoutineView.startButton.isEnabled = false
            parentChildRoutineView.startButton.backgroundColor = .gray
        }
        
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
