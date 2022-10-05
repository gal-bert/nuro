//
//  ViewController.swift
//  Daftar Aktivitas Main
//
//  Created by Finn Christoffer Kurniawan on 04/10/22.
//

import UIKit
import SnapKit

class ParentActivityListView: UIView {
    
    let moreButton = MoreButton()
    let smallCapsuleButton = SmallCapsuleButton()
    var delegate: ParentActivityListDelegate
    func setup(vc: ParentActivityListViewController) {
        delegate = vc
        self.vc = vc
        
        backgroundColor = .white
        
        setupNavigationBar()
    }
    
    //    private func setupConstraints() {
    //        label.snp.makeConstraints { make in
    //            make.top.left.right.equalTo(safeAreaLayoutGuide).inset(20)
    //        }
    //    }
    
    private func setupNavigationBar() {
        
        //Title Navbar
        vc.title = "Daftar Aktivitas"
        vc.navigationController?.navigationBar.prefersLargeTitles = true
        
        vc.navigationItem.rightBarButtonItem = [
            UIBarButtonItem(customView: moreButton),
            UIBarButtonItem(customView: smallCapsuleButton)
        ]
        
        moreButton.addTarget(self, action: #selector(smallCapsuleButton), for: .touchUpInside)
        smallCapsuleButton.addTarget(self, action: #selector(selectbutton), for: .touchUpInside)
    }
    
    @objc private func selectButtonAction() {
        delegate.printText(text: "Select Button Clicked")
    }
    
    @objc private func smallCapsuleButtonAction() {
        delegate.printText(text: "More Button Clicked")
    }
    
    private func setupConstraints() {
        
    }


