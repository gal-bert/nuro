//
//  ParentTodayActivityView.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/10/22.
//

import UIKit

class ParentTodayActivityView: UIView {
    
    let jumbotron = Jumbotron()
    
    let emptyState = ParentTodayActivityEmptyStateView()
    
    let headerLabel: UILabel = {
        let view = UILabel()
        view.textColor = Colors.Text.onyx
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
        view.backgroundColor = Colors.Neutral.white
        return view
    }()
    
    let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.spacing = 20
        return view
    }()
    
    var delegate: ParentTodayActivityDelegate!
    
    func setup(vc: ParentTodayActivityViewController) {
        delegate = vc
        tableView.dataSource = vc
        tableView.delegate = vc
        tableView.register(ParentTodayActivityTableViewCell.self, forCellReuseIdentifier: ParentTodayActivityTableViewCell.identifier)
            
        backgroundColor = Colors.Neutral.white
    
        setupNavigationBar(vc: vc)
        
        addSubview(scrollView)
        scrollView.addSubview(stackView)
        stackView.addArrangedSubview(jumbotron)
        stackView.addArrangedSubview(headerLabel)
        stackView.addArrangedSubview(tableView)
        
        setupConstraints()
    }
    
    private func setupEmptyState() {
        stackView.removeArrangedSubview(tableView)
        stackView.addArrangedSubview(emptyState)
        stackView.setCustomSpacing(ScreenSizes.quarterScreenHeight - 60, after: headerLabel)
    }
    
    private func setupNavigationBar(vc: ParentTodayActivityViewController) {
        vc.navigationController?.navigationBar.backgroundColor = Colors.Neutral.white
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

