//
//  SettingViewController.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 03/11/22.
//

import UIKit

class SettingViewController: UIViewController {
    
    let settingView = SettingView()
    let viewModel = SettingViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        settingView.setup(vc: self)
    }
    
    override func loadView() {
        self.view = settingView
    }
    
//    overri
}
