//
//  AddActivityView.swift
//  Nuro
//
//  Created by Gregorius Albert on 20/10/22.
//

import UIKit

class AddActivityView: UIView {

    func setup(vc: AddActivityViewController) {
        backgroundColor = .white

        setupNavigationBar(vc: vc)
        setupConstraints()
    }
    
    func setupNavigationBar(vc: AddActivityViewController) {
        vc.title = "Tambah Aktivitas - Pagi"
    }
    
    private func setupConstraints() {
   
    }
    
    // TODO: Setup Search Bar Controller
    
}
