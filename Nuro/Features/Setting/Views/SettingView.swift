//
//  SettingView.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 03/11/22.
//

import UIKit
import SnapKit

class SettingView: UIView {
    
    var delegate: SettingDelegate!
    var vc: SettingViewController!
    
    let tableViewProfile: UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.separatorColor = .clear
        view.backgroundColor = .clear
        view.allowsSelection = false
        return view
    }()
    
    let profileLabel: UILabel = {
        let view = UILabel()
        view.text = "Profil"
        view.textColor = .black
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 30)
        return view
    }()
    
    let TimeLabel: UILabel = {
        let view = UILabel()
        view.text = "Waktu"
        view.textColor = .black
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 30)
        return view
    }()
    
    let tableViewTime: UITableView = {
        let view = UITableView()
        view.separatorColor = .clear
        view.backgroundColor = .clear
        view.allowsSelection = false
        return view
    }()
    
    private lazy var timePicker: UIDatePicker = {
        let view = UIDatePicker()
        view.datePickerMode = .time
        return view
    }()
    
    func setup(vc: SettingViewController) {
        backgroundColor = Colors.Neutral.white
        delegate = vc
        self.vc = vc
        
        tableViewProfile.dataSource = vc
        tableViewProfile.delegate = vc
        tableViewProfile.register(SettingParentChildTableViewCell.self, forCellReuseIdentifier: SettingParentChildTableViewCell.identifier)
        tableViewTime.dataSource = vc
        tableViewTime.delegate = vc
        tableViewTime.register(SettingTimeTableViewCell.self, forCellReuseIdentifier: SettingTimeTableViewCell.identifier)
//        tableView.register(HeaderTimeframeSection.self, forHeaderFooterViewReuseIdentifier: HeaderTimeframeSection.identifier)
        addSubview(profileLabel)
        addSubview(tableViewProfile)
        addSubview(TimeLabel)
        addSubview(tableViewTime)
        addSubview(timePicker)
        
        
        setupNavigationBar()
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        vc.navigationController?.navigationBar.barTintColor = Colors.Neutral.white
        //Title Navbar
        vc.title = Strings.SettingTitle
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.bold, size: 48) ?? UIFont.systemFont(ofSize: 48)]
    }
    
    private func setupConstraints() {
        profileLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(25)
            make.left.equalTo(safeAreaLayoutGuide).offset(21)
            
        }
        
        tableViewProfile.snp.makeConstraints { make in
            make.top.equalTo(profileLabel.snp.bottom)
            make.left.right.equalTo(self)
            make.height.equalTo(150)
        }
        
        TimeLabel.snp.makeConstraints { make in
            make.top.equalTo(tableViewProfile.snp.bottom)
            make.left.equalTo(self).offset(25)
//            make.height.equalTo()
        }
        
        tableViewTime.snp.makeConstraints { make in
            make.top.equalTo(TimeLabel.snp.bottom).offset(10)
            make.left.right.equalTo(self).inset(15)
            make.height.equalTo(200)
        }
    }
    
}
