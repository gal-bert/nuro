//
//  ParentTodayActivityEditOrder.swift
//  Nuro
//
//  Created by Gregorius Albert on 18/10/22.
//

import UIKit

class ParentTodayActivityEditOrderView: UIView {
    
    var delegate: ParentTodayActivityEditOrderDelegate!

    private lazy var navBar: UINavigationBar = {
        let view = UINavigationBar()
        return view
    }()
    
    var tableView: UITableView = {
        let view = UITableView()
        view.separatorColor = .clear
        view.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 80, right: 0)
        view.isEditing = true
        
        return view
    }()
    
    func setup(vc: ParentTodayActivityEditOrderViewController) {
        backgroundColor = .white
        delegate = vc
        tableView.delegate = vc
        tableView.dataSource = vc
        tableView.dragDelegate = vc
        tableView.dragInteractionEnabled = true
        tableView.register(ActivitiesTableViewCell.self, forCellReuseIdentifier: ActivitiesTableViewCell.identifier)
        
        addSubview(tableView)
        
        setupNavigationBar(vc: vc)
        setupConstraints()
    }
    
    func setupNavigationBar(vc: ParentTodayActivityEditOrderViewController) {
        vc.title = "Aktivitas Hari Ini - Pagi"
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Selesai", style: .plain, target: self, action: #selector(dismissAction))
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Tambah", style: .plain, target: self, action: #selector(tambah))
    }
    
    @objc func dismissAction() {
        delegate.dismissViewController()
    }
    
    @objc func tambah() {
        let dest = AddActivityViewController()
        delegate.pushViewController()
    }
    
    
    private func setupConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.right.equalTo(self)
            make.bottom.equalTo(self)
        }
        
    }
    
}
