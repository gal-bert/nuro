//
//  ParentTodayActivityView.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/10/22.
//

import UIKit
import SnapKit

class ParentTodayActivityView: UIView {
    
    let label: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.text = "Hello World"
        return view
    }()
    
    func setup() {
        backgroundColor = .white
        addSubview(label)
        setupConstraints()
    }
    
    private func setupConstraints() {
        label.snp.makeConstraints { make in
            make.top.left.right.equalTo(safeAreaLayoutGuide).inset(20)
        }
    }
    
}
