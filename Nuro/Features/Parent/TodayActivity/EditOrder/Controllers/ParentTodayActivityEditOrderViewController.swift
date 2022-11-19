//
//  ParentTodayActivityEditOrderViewController.swift
//  Nuro
//
//  Created by Gregorius Albert on 18/10/22.
//

import UIKit

class ParentTodayActivityEditOrderViewController: UIViewController {
    
    let parentTodayActivityEditOrderView = ParentTodayActivityEditOrderView()
    
    var mirrorDetails = [MirrorDetail]()
    var editedTimeFrame: Int?
    
    var reloadDelegate: ReloadDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModalInPresentation = true
        parentTodayActivityEditOrderView.setup(vc: self, timeFrame: editedTimeFrame ?? 0)
        
        // Disable swipe down to dismiss / lightbox mode
    }
    
    override func viewWillAppear(_ animated: Bool) {
        parentTodayActivityEditOrderView.tableView.reloadData()
    }
    
    override func loadView() {
        view = parentTodayActivityEditOrderView
    }

}
