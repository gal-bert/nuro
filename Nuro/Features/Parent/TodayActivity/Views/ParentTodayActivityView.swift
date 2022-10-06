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
        view.isScrollEnabled = false
        return view
    }()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = .green
        return view
    }()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        return view
    }()
    
    var delegate: ParentTodayActivityDelegate!
    var vc: ParentTodayActivityViewController!
    
    func setup(vc: ParentTodayActivityViewController) {
        self.vc = vc
        delegate = vc
        tableView.dataSource = vc
        tableView.delegate = vc
        tableView.register(ParentActivityTableViewCell.self, forCellReuseIdentifier: ParentActivityTableViewCell.identifier)
            
        backgroundColor = .white
    
        setupNavigationBar()
        
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(jumbotron)
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(tableView)
        
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        vc.title = "Halo, Mom"
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationController?.navigationBar.backgroundColor = .white
        
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
        
        scrollView.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(safeAreaLayoutGuide)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(scrollView)
            make.left.right.equalTo(scrollView).inset(20)
            make.width.equalTo(scrollView.snp.width).inset(20)
        }
        stackView.setCustomSpacing(40, after: jumbotron)
        
        jumbotron.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.top).offset(20)
            make.height.equalTo(200)
        }

        tableView.snp.makeConstraints { make in
            make.height.equalTo(15 * Constants.COLLECTION_VIEW_CELL_HEIGHT)
        }
    }
    
}
