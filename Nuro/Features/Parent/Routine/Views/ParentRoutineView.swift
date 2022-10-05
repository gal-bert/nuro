//
//  ParentRoutineView.swift
//  Nuro
//
//  Created by Samuel Dennis on 05/10/22.
//

import UIKit
import SnapKit

class ParentRoutineView: UIView {
    
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
        vc.title = "Rutinitas"
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        
        let moreButton = MoreButton()
        
        let customView = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        customView.setTitle("Pilih", for: .normal)
        customView.titleLabel?.font = UIFont(name: ".AppleSystemUIFont", size: 24)
        customView.backgroundColor = .systemBlue
        customView.layer.cornerRadius = 20
        
        
        let pilihButton = UIBarButtonItem(customView: customView)
        
        let moreBtn = UIBarButtonItem(customView: moreButton)
        
        vc.navigationItem.rightBarButtonItems = [moreBtn, pilihButton]
        
        addSubview(segmentedControl)
        segmentedControl.addTarget(self, action: #selector(segmentedValueChanged), for: .valueChanged)
        
        addSubview(labelHeader)
        
        
        setupConstraint()

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
    
    @objc func segmentedValueChanged() -> Void {
        print("Selected Segment is : \(segmentedControl.selectedSegmentIndex)")
    }
}
