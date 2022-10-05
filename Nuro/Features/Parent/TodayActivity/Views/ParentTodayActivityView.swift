//
//  ParentTodayActivityView.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/10/22.
//

import UIKit
import SnapKit

class ParentTodayActivityView: UIView {
    
    let moreButton = MoreButton()
    let smallCapsuleButton = SmallCapsuleButton()
    let jumbotron = Jumbotron()
    
    let headerLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = UIFont.systemFont(ofSize: 32, weight: .bold)
        view.text = "Aktivitas Mendatang"
        return view
    }()
    
    let tableView: UITableView = {
        let view = UITableView()
        return view
    }()
    
    var delegate: ParentTodayActivityDelegate!
    var vc: ParentTodayActivityViewController!
    
    func setup(vc: ParentTodayActivityViewController) {
        self.vc = vc
        delegate = vc
        tableView.dataSource = vc
        tableView.delegate = vc
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        
        backgroundColor = .white
    
        setupNavigationBar()
        addSubview(jumbotron)
        addSubview(headerLabel)
        addSubview(tableView)
        
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        vc.title = "Halo, Mom"
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        
        vc.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: moreButton),
            UIBarButtonItem(customView: smallCapsuleButton)
        ]
        
        moreButton.addTarget(self, action: #selector(smallCapsuleButtonAction), for: .touchUpInside)
        smallCapsuleButton.addTarget(self, action: #selector(selectButtonAction), for: .touchUpInside)
    }
    
    @objc private func selectButtonAction() {
        delegate.printText(text: "Select Button Clicked")
    }

    @objc private func smallCapsuleButtonAction() {
        delegate.printText(text: "More Button Clicked")
    }
    
    private func setupConstraints() {
        jumbotron.snp.makeConstraints { make in
            make.top.left.right.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(200)
        }
        
        headerLabel.snp.makeConstraints { make in
            make.top.equalTo(jumbotron.snp.bottom).offset(40)
            make.left.equalTo(safeAreaLayoutGuide).inset(20)
        }
        
        tableView.snp.makeConstraints { make in
            make.top.equalTo(headerLabel.snp.bottom).offset(20)
            make.left.right.bottom.equalTo(self).inset(0)
        }
    }
    
}
