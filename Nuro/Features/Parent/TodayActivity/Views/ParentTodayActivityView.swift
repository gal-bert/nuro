//
//  ParentTodayActivityView.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/10/22.
//

import UIKit
import SnapKit

class ParentTodayActivityView: UIView {
    
    let moreButton = MoreButton()
    let smallCapsuleButton = SmallCapsuleButton()
    var delegate: ParentTodayActivityDelegate!
    
    var vc: ParentTodayActivityViewController!
    
    func setup(vc: ParentTodayActivityViewController) {
        delegate = vc
        self.vc = vc
        
        backgroundColor = .white
    
        setupNavigationBar()
        setupConstraints()
    }
    
    private func setupNavigationBar() {
        vc.title = "Halo, Mom"
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        
        vc.navigationItem.rightBarButtonItems = [
            UIBarButtonItem(customView: moreButton),
            UIBarButtonItem(customView: smallCapsuleButton)
        ]
        
        moreButton.addTarget(self, action: #selector(smallCapsuleButtonAction), for: .touchUpInside)
        smallCapsuleButton.addTarget(self, action: #selector(selectButtonAction), for: .touchUpInside)
    }
    
    
    @objc private func selectButtonAction() {
        delegate.printText(text: "Select Button Clicked")
    }

    @objc private func smallCapsuleButtonAction() {
        delegate.printText(text: "More Button Clicked")
    }
    
    private func setupConstraints() {
        
    }
    
}
