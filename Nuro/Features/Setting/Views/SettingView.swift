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
//        view.separatorColor = .clear
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
    
    let timeLabel: UILabel = {
        let view = UILabel()
        view.text = "Waktu"
        view.textColor = .black
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 30)
        return view
    }()
    
    let tableViewTime: UITableView = {
        let view = UITableView(frame: .zero, style: .insetGrouped)
        view.separatorColor = .clear
        view.backgroundColor = .clear
        view.allowsSelection = false
//        view.layer.cornerRadius = 20
//        view.clipsToBounds = true
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
        addSubview(timeLabel)
        addSubview(tableViewTime)
                
        setupNavigationBar()
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        vc.navigationController?.navigationBar.barTintColor = Colors.Neutral.white
        //Title Navbar
        vc.title = Strings.settingsTitle
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
        
        timeLabel.snp.makeConstraints { make in
            make.top.equalTo(tableViewProfile.snp.bottom).offset(30)
            make.left.equalTo(self).offset(25)
        }
        
        tableViewTime.snp.makeConstraints { make in
            make.top.equalTo(timeLabel.snp.bottom)
            make.left.right.equalTo(self)
            make.height.equalTo(200)
        }
    }
    
}
