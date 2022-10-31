//
//  AddActivityRoutineTimeView.swift
//  Nuro
//
//  Created by Samuel Dennis on 30/10/22.
//

import UIKit

class AddActivityRoutineTimeView: UIView {
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.allowsMultipleSelection = true
        view.separatorColor = Colors.Background.pinkLace
        view.isScrollEnabled = false
        return view
    }()
    
    var delegate: ParentRoutineAddActivityRoutineTimeDelegate!
    var vc: AddActivityRoutimeTimeViewController!
    
    func setup(vc: AddActivityRoutimeTimeViewController) {
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
    
    private func setupNavigationBar(vc: AddActivityRoutimeTimeViewController) {
        vc.title = "Waktu Rutinitas"
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Selesai", style: .plain, target: self, action: #selector(didFinishButtonClicked))
    }
    
    @objc func didFinishButtonClicked() {
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
