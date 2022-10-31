//
//  ParentTodayActivityEditOrderViewController.swift
//  Nuro
//
//  Created by Gregorius Albert on 18/10/22.
//

import UIKit

class ParentTodayActivityEditOrderViewController: UIViewController {
    
    let parentTodayActivityEditOrderView = ParentTodayActivityEditOrderView()
    
    var routineDetails = [RoutineDetail]()
    
    var reloadDelegate: ReloadDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModalInPresentation = true
        parentTodayActivityEditOrderView.setup(vc: self)
        
        // Disable swipe down to dismiss / lightbox mode
    }
    
    override func loadView() {
        view = parentTodayActivityEditOrderView
    }

}
