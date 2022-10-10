//
//  ParentRoutineView.swift
//  Nuro
//
//  Created by Samuel Dennis on 05/10/22.
//

import UIKit
import SnapKit

class ParentRoutineView: UIView {
    
    var delegate: ParentRoutineDelegate!
    
    let segmentedControl: UISegmentedControl = {
        let view = UISegmentedControl(items: ["Senin", "Selasa", "Rabu", "Kamis", "Jumat", "Sabtu", "Minggu"])
        view.selectedSegmentIndex = 0
        return view
    }()
    
    let labelHeader: UILabel = {
        let view = UILabel()
        view.text = "Pagi"
        view.textAlignment = .left
        view.font = UIFont.boldSystemFont(ofSize: 28)
        return view
    }()
    
    func setup(vc: ParentRoutineViewController) {
        backgroundColor = .white
        
        delegate = vc
        
        vc.title = "Rutinitas"
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        
        let moreBtn = MoreButton()
        let editBtn = SmallCapsuleButton(title: "Edit")
        
        let moreButton = UIBarButtonItem(customView: moreBtn)
        let editButton = UIBarButtonItem(customView: editBtn)
        
        vc.navigationItem.rightBarButtonItems = [moreButton, editButton]
        
        addSubview(segmentedControl)
        segmentedControl.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
        
        addSubview(labelHeader)
        
        setupConstraint()

    }
    
    @objc func segmentedValueChanged() {
        delegate?.printText(text: "\(segmentedControl.selectedSegmentIndex)")
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
