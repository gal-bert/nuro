//
//  AddActivityRoutineDayView.swift
//  Nuro
//
//  Created by Samuel Dennis on 31/10/22.
//

import UIKit

class AddActivityRoutineDayView: UIView {
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.allowsMultipleSelection = true
        view.separatorColor = Colors.Background.pinkLace
        view.isScrollEnabled = false
        return view
    }()
    
    var delegate: ParentRoutineAddActivityRoutineDayDelegate!
    var delegateData: ParentRoutineAddActivityDayDataDelegate!
    var vc: AddActivityRoutineDayViewController!
    
    func setup(vc: AddActivityRoutineDayViewController) {
        backgroundColor = Colors.Neutral.white
        
        self.vc = vc
        delegate = vc
    
        tableView.dataSource = vc
        tableView.delegate = vc
        tableView.register(PlainTableViewCell.self, forCellReuseIdentifier: PlainTableViewCell.identifier)
        
        setupNavigationBar(vc: vc)
        
        addSubview(tableView)
        
        setupConstraints()
    }
    
    private func setupNavigationBar(vc: AddActivityRoutineDayViewController) {
        vc.title = "Hari Rutinitas"
    }
    
    @objc func didFinishButtonClicked() {
        var tempArr = [Int]()
        for i in 0...6 {
            if let cell = tableView.cellForRow(at: IndexPath(row: i, section: 0)) {
                if cell.accessoryType == .checkmark {
                    tempArr.append(i)
                }
            }
        }
        delegateData.sendDaysResult(days: tempArr)
        delegate.popViewController()
    }
    
    private func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.left.right.equalTo(safeAreaLayoutGuide).inset(40)
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
