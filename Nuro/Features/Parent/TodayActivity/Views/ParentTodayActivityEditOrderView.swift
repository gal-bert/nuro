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
        
        return view
    }()
    
    func setup(vc: ParentTodayActivityEditOrderViewController) {
        backgroundColor = .white
        
        tableView.delegate = vc
        tableView.dataSource = vc
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        addSubview(tableView)
        
        setupNavigationBar(vc: vc)
        setupConstraints()
    }
    
    func setupNavigationBar(vc: ParentTodayActivityEditOrderViewController) {
        vc.title = "Aktivitas Hari Ini - Pagi"
        vc.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Selesai", style: .plain, target: self, action: #selector(dismissAction))
        vc.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Tambah", style: .plain, target: self, action: #selector(tambah))
        vc.navigationItem.leftBarButtonItem?.tintColor = Colors.Brand.blueViolet
        vc.navigationItem.rightBarButtonItem?.tintColor = Colors.Brand.blueViolet
    }
    
    func setupDelegate(vc: ParentTodayActivityEditOrderViewController) {
        delegate = vc
    }
    
    @objc func dismissAction() {
        delegate.dismissViewController()
    }
    
    @objc func tambah() {
        delegate.pushViewController(dest: UIViewController())
    }
    
    
    private func setupConstraints() {
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.left.right.bottom.equalTo(self)
        }
        
    }
    
}
