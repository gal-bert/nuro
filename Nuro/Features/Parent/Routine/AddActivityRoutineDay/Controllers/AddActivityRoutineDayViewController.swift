//
//  AddActivityRoutineDayViewController.swift
//  Nuro
//
//  Created by Samuel Dennis on 31/10/22.
//

import UIKit

class AddActivityRoutineDayViewController: UIViewController {

    let addActivityRoutineDayView = AddActivityRoutineDayView()
    let addActivityRoutineDayViewModel = AddActivityRoutineDayViewModel()
    var delegateData: ParentRoutineAddActivityDayDataDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModalInPresentation = true
        addActivityRoutineDayView.setup(vc: self)
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        var tempArr = [Int]()
        for i in 0...6 {
            if let cell = addActivityRoutineDayView.tableView.cellForRow(at: IndexPath(row: i, section: 0)) {
                if cell.accessoryType == .checkmark {
                    tempArr.append(i)
                }
            }
        }
        delegateData.sendDaysResult(days: tempArr)
    }
    
    override func loadView() {
        view = addActivityRoutineDayView
    }
}
