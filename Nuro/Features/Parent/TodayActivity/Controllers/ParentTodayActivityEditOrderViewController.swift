//
//  ParentTodayActivityEditOrderViewController.swift
//  Nuro
//
//  Created by Gregorius Albert on 18/10/22.
//

import UIKit

class ParentTodayActivityEditOrderViewController: UIViewController {
    
    let parentTodayActivityEditOrderView = ParentTodayActivityEditOrderView()
    
    var arr = ["Alpha", "Beta", "Charlie", "Delta", "Eppon"]

    override func viewDidLoad() {
        super.viewDidLoad()
        parentTodayActivityEditOrderView.setup(vc: self)
        
        // Disable swipe down to dismiss / lightbox mode
        self.isModalInPresentation = true
    }
    
    override func loadView() {
        view = parentTodayActivityEditOrderView
    }

}
