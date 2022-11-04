//
//  ParentChildRoutineView.swift
//  Nuro
//
//  Created by Karen Natalia on 17/10/22.
//

import UIKit

protocol ParentChildRoutineDelegate {
    func toChildMode()
}

class ParentChildRoutineView: UIView {
    
    private lazy var pageTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 48)
        label.text = "Rutinitas Anak"
        label.textAlignment = .center
        return label
    }()
    
    private lazy var guidedAccessLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 22)
        
        var boldAttribute = [NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.bold, size: 22)]
        var boldString = NSMutableAttributedString(string: "Guided Access", attributes: boldAttribute)
        
        var regularAttribute = [NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.regular, size: 22)]
        var regularString = NSMutableAttributedString(string: " belum dinyalakan ", attributes: regularAttribute)
        
        let imageAttachment = TextAttachments.getMulticoloredAttachment(imageName: "questionmark.circle.fill", firstColorName: Colors.Text.onyx, secondColorName: Colors.Background.alabaster)
        
        var attributedString = NSMutableAttributedString(attributedString: boldString)
        attributedString.append(NSMutableAttributedString(attributedString: regularString))
        attributedString.append(NSMutableAttributedString(attachment: imageAttachment))
        
        label.attributedText = attributedString
        label.textAlignment = .center
        return label
    }()
    
    private lazy var routineTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.backgroundColor = Colors.Background.water
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
        stackView.spacing = 32
        stackView.alignment = .center
        return stackView
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .custom)
        button.configuration = .plain()
        button.addTarget(self, action: #selector(toChildMode), for: .touchUpInside)
        button.layer.cornerRadius = 20
        button.clipsToBounds = true
        button.backgroundColor = Colors.Brand.blueViolet
        
        let font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 32)
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
    }
    
    private func setupUI() {
        self.backgroundColor = Colors.Neutral.white
        
        addSubview(stackView)
        stackView.addArrangedSubview(pageTitleLabel)
        stackView.addArrangedSubview(routineTableView)
        stackView.addArrangedSubview(startButton)
        stackView.addArrangedSubview(guidedAccessLabel)
    }
    
    private func setupConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.left.bottom.right.equalTo(self).inset(40)
        }
        
        startButton.snp.makeConstraints { make in
            make.height.equalTo(80)
            make.width.equalTo(ScreenSizes.halfScreenWidth)
        }
        
        routineTableView.snp.makeConstraints { make in
            make.left.right.equalTo(stackView)
        }
    }
    
    private func setupTableView(vc: ParentChildRoutineViewController) {
        routineTableView.dataSource = vc
        routineTableView.delegate = vc
        routineTableView.register(ParentTodayActivityTableViewCell.self, forCellReuseIdentifier: ParentTodayActivityTableViewCell.identifier)
    }
    
    @objc func toChildMode() {
        delegate?.toChildMode()
    }
}
