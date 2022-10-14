//
//  ParentRoutineView.swift
//  Nuro
//
//  Created by Samuel Dennis on 05/10/22.
//

import UIKit
import SnapKit

class ParentRoutineView: UIView {
    
    let addButton = AddButton()
    let editButton = SmallCapsuleButton(title: "Edit")
    
    let segmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(items: ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"])
        view.selectedSegmentIndex = 0
        return view
    }()
    
    let labelHeader: UILabel = {
        let view = UILabel()
        view.font = UIFont(name: Fonts.VisbyRoundCF.bold, size: 36)
        view.text = "Pagi"
        view.textAlignment = .left
        return view
    }()
    
    var delegate: ParentRoutineDelegate!
    var vc: ParentRoutineViewController!
    
    func setup(vc: ParentRoutineViewController) {
        backgroundColor = Colors.Neutral.white
        
        self.vc = vc
        delegate = vc
        
        setupNavigationBar()
        
        addSubview(segmentedControl)
        segmentedControl.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
        
        addSubview(labelHeader)
        
        setupConstraint()
    }
    
    private func setupNavigationBar() {
        vc.title = Strings.parentRoutineTitle
        vc.navigationController?.navigationBar.largeTitleTextAttributes = [ NSAttributedString.Key.font: UIFont(name: Fonts.VisbyRoundCF.bold, size: 40)!]
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        vc.navigationController?.navigationBar.backgroundColor = Colors.Neutral.white
        
        vc.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: addButton),
            UIBarButtonItem(customView: editButton)
        ]
        
        addButton.addTarget(self, action: #selector(didAddButtonClicked), for: .touchUpInside)
        editButton.addTarget(self, action: #selector(didEditButtonClicked), for: .touchUpInside)
    }
    
    @objc private func didAddButtonClicked() {
        delegate.printText(text: "Add Button Clicked")
    }
    
    @objc private func didEditButtonClicked() {
        delegate.printText(text: "Edit Button Clicked")
    }
    
    @objc func segmentedValueChanged() {
        delegate?.printText(text: "Selected segmented \(segmentedControl.selectedSegmentIndex)")
    }
    
    private func setupConstraint() {
        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(20)
            make.left.right.equalToSuperview().inset(20)
        }
        labelHeader.snp.makeConstraints { make in
            make.top.equalTo(segmentedControl.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(20)
        }
    }
}
