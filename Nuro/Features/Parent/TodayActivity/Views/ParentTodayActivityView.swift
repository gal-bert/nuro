//
//  ParentTodayActivityView.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/10/22.
//

import UIKit
import SnapKit

class ParentTodayActivityView: UIView {
    
    let addButton = AddButton()
    let smallCapsuleButton = SmallCapsuleButton()
    let jumbotron = Jumbotron()
    
    let headerLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.black
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 36)
        view.text = Strings.parentTodayActivityTitle
        return view
    }()
    
    let tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.isScrollEnabled = false
        view.allowsSelection = false
        view.separatorColor = .clear
        view.backgroundColor = .clear
        return view
    }()
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.backgroundColor = Colors.white
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
        tableView.register(ParentTodayActivityTableViewCell.self, forCellReuseIdentifier: ParentTodayActivityTableViewCell.identifier)
            
        backgroundColor = Colors.white
    
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
        vc.navigationController?.navigationBar.backgroundColor = Colors.white

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
        
        stackView.setCustomSpacing(8, after: headerLabel)

        tableView.snp.makeConstraints { make in
            make.height.equalTo(CollectionViewAttributes.collectionViewCellHeight * 5)
        }
    }
    
}
