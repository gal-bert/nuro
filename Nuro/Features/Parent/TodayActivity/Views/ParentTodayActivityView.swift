//
//  ParentTodayActivityView.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/10/22.
//

import UIKit
import SnapKit

class ParentTodayActivityView: UIView {
    
    let moreBtn = SelectButton(title: "asd")
    var delegate: ParentTodayActivityDelegate!
    
    func setup(vc: ParentTodayActivityViewController) {
        backgroundColor = .white
        
        delegate = vc
        
        vc.title = "Halo, Mom"
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        
        addSubview(moreBtn)
        
        moreBtn.addTarget(self, action: #selector(btnAction), for: .touchUpInside)
        
        setupConstraints()
    }
    
    @objc func btnAction() {
        delegate?.printText()
    }
    
    private func setupConstraints() {
        moreBtn.snp.makeConstraints { make in
            make.top.left.equalTo(safeAreaLayoutGuide).inset(20)
        }
    }
    
}
