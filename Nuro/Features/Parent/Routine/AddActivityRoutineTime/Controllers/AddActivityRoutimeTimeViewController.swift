//
//  AddActivityRoutimeTimeViewController.swift
//  Nuro
//
//  Created by Samuel Dennis on 30/10/22.
//

import UIKit

class AddActivityRoutimeTimeViewController: UIViewController {

    let addActivityRoutineTimeView = AddActivityRoutineTimeView()
    let addActivityRoutineTimeViewModel = AddActivityRoutineTimeViewModel()
    var delegateData: ParentRoutineAddActivityTimeDataDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModalInPresentation = true
        addActivityRoutineTimeView.setup(vc: self)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        var tempArr = [Int]()
        for i in 0...2 {
            if let cell = addActivityRoutineTimeView.tableView.cellForRow(at: IndexPath(row: i, section: 0)) {
                if cell.accessoryType == .checkmark {
                    tempArr.append(i)
                }
            }
        }
        delegateData.sendTimesResult(times: tempArr)
    }
    
    override func loadView() {
        view = addActivityRoutineTimeView
    }

}
