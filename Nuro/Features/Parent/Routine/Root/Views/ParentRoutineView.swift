//
//  ParentRoutineView.swift
//  Nuro
//
//  Created by Samuel Dennis on 05/10/22.
//

import UIKit
import SnapKit

class ParentRoutineView: UIView {
    
    let addButton = AddButton()
    let editButton = SmallCapsuleButton(title: "Edit")
    
    let segmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(items: ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"])
        view.selectedSegmentIndex = 0
        
        let selectedTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.bold, size: 20)]
        let normalTextAttributes = [ NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.regular, size: 20)]
        view.setTitleTextAttributes(selectedTextAttributes as [NSAttributedString.Key : Any], for: .selected)
        view.setTitleTextAttributes(normalTextAttributes as [NSAttributedString.Key : Any], for: .normal)
        view.selectedSegmentTintColor = Colors.Brand.blueViolet
        
        return view
    }()
    
    let tableView: UITableView = {
        let view = UITableView()
//        view.allowsSelection = false
        view.separatorColor = .clear
        view.backgroundColor = .clear
        return view
    }()
    
    var delegate: ParentRoutineDelegate!
    var vc: ParentRoutineViewController!
    
    func setup(vc: ParentRoutineViewController) {
        backgroundColor = Colors.Neutral.white
        
        self.vc = vc
        delegate = vc
        
        tableView.dataSource = vc
        tableView.delegate = vc
        tableView.dragDelegate = vc
        tableView.dragInteractionEnabled = false
        tableView.register(ActivitiesTableViewCell.self, forCellReuseIdentifier: ActivitiesTableViewCell.identifier)
        tableView.register(HeaderTimeframeSection.self, forHeaderFooterViewReuseIdentifier: HeaderTimeframeSection.identifier)
        
        setupNavigationBar()
        
        addSubview(segmentedControl)
        segmentedControl.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
        
        segmentedControl.selectedSegmentIndex = Date().getCurrentWeekday() - 1
        
        addSubview(tableView)
        
        setupConstraint()
    }
    
    private func setupNavigationBar() {
        vc.title = Strings.parentRoutineTitle
        vc.navigationController?.navigationBar.largeTitleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.bold, size: 40)!]
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationController?.navigationBar.backgroundColor = Colors.Neutral.white
        
        vc.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: addButton),
            UIBarButtonItem(customView: editButton)
        ]
        
        addButton.addTarget(self, action: #selector(didAddButtonClicked), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(didEditButtonClicked), for: .touchUpInside)
    }
    
    @objc private func didAddButtonClicked() {
        let dest = ParentRoutineAddActivityViewController()
        dest.reloadDelegate = vc
        dest.selectedIndex = segmentedControl.selectedSegmentIndex
        delegate.presentViewController(dest: dest, modalHeight: ScreenSizes.modalHeight)
    }
    
    @objc private func didEditButtonClicked() {
        tableView.setEditing(!tableView.isEditing, animated: true)
        editButton.setTitle((tableView.isEditing == true) ? "Selesai" : "Edit", for: .normal)
        editButton.frame.size.width = (tableView.isEditing == true) ? 80 : 60
        tableView.dragInteractionEnabled = (tableView.isEditing == true) ? true : false
    }
    
    @objc func segmentedValueChanged() {
        delegate.loadActivitiesForDay(dayId: segmentedControl.selectedSegmentIndex+1)
        tableView.reloadData()
    }
    
    private func setupConstraint() {
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(30)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
