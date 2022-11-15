//
//  ParentChildRoutineView.swift
//  Nuro
//
//  Created by Karen Natalia on 17/10/22.
//

import UIKit
import SnapKit

protocol ParentChildRoutineDelegate {
    func toChildMode()
    func hintPopover()
}

class ParentChildRoutineView: UIView {
    
    private lazy var pageTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 48)
        label.text = "Rutinitas Anak"
        label.textAlignment = .center
        return label
    }()
    
    lazy var guidedAccessStackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.spacing = 5
        sv.alignment = .center
        sv.distribution = .fill
        return sv
    }()
    
    lazy var hintButton = HintButton()
    
    lazy var guidedAccessLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 22)
        
        label.attributedText = GuidedAccessLabelConfiguration.getAttributedText(boldText: "Guided Access", text: "belum dinyalakan")
        return label
    }()
    
    lazy var routineTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.allowsSelection = false
        tableView.separatorColor = .clear
        tableView.layer.cornerRadius = 30
        tableView.clipsToBounds = true
        return tableView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.alignment = .center
        return stackView
    }()
    
    lazy var startButton: UIButton = {
        let button = UIButton(type: .custom)
        button.configuration = .plain()
        button.addTarget(self, action: #selector(toChildMode), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.backgroundColor = Colors.Brand.blueViolet
        
        let font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 32) ?? UIFont()
        let attributedTitle = NSAttributedString(string: "Mulai Rutinitas Anak", attributes: [NSAttributedString.Key.font: font, NSAttributedString.Key.foregroundColor: Colors.Neutral.white])
        button.setAttributedTitle(attributedTitle, for: UIControl.State.normal)
        
        return button
    }()
    
    private var delegate: ParentChildRoutineDelegate?
    
    func setup(vc: ParentChildRoutineViewController) {
        delegate = vc
        
        setupUI()
        setupConstraints()
        setupTableView(vc: vc)
        setupButton()
    }
    
    private func setupUI() {
        self.backgroundColor = Colors.Neutral.white
        
        addSubview(stackView)
        stackView.addArrangedSubview(pageTitleLabel)
        stackView.addArrangedSubview(routineTableView)
        stackView.addArrangedSubview(startButton)
        addSubview(guidedAccessStackView)
        guidedAccessStackView.addArrangedSubview(guidedAccessLabel)
        guidedAccessStackView.addArrangedSubview(hintButton)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.left.right.equalTo(self).inset(20)
            make.bottom.equalTo(guidedAccessStackView.snp.top).offset(-20)
        }
        
        startButton.snp.makeConstraints { make in
            make.height.equalTo(ScreenSizes.halfScreenHeight / 5)
            make.width.equalTo(ScreenSizes.halfScreenWidth)
        }
        
        routineTableView.snp.makeConstraints { make in
            make.left.right.equalTo(stackView)
            make.height.equalTo(ScreenSizes.screenHeight * 2/3)
        }
        
        guidedAccessStackView.snp.makeConstraints { make in
            make.top.equalTo(stackView.snp.bottom)
            make.centerX.equalTo(startButton)
        }
    }
    
    private func setupTableView(vc: ParentChildRoutineViewController) {
        routineTableView.dataSource = vc
        routineTableView.delegate = vc
        routineTableView.register(ParentTodayActivityTableViewCell.self, forCellReuseIdentifier: ParentTodayActivityTableViewCell.identifier)
    }
    
    private func setupButton() {
        hintButton.addTarget(self, action: #selector(didHintButtonClicked), for: .touchUpInside)
    }
    
    @objc func toChildMode() {
        delegate?.toChildMode()
    }
    
    @objc func didHintButtonClicked() {
        delegate?.hintPopover()
    }
}
