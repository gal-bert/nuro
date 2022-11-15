//
//  ParentTodayActivityDetailViewController.swift
//  Nuro
//
//  Created by Gregorius Albert on 24/10/22.
//

import UIKit

class ParentTodayActivityDetailViewController: UIViewController {
    
    let parentTodayActivityDetailView = ParentTodayActivityDetailView()
    var detail: AnyObject?
    
    var reloadDelegate: ReloadDelegate!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.isModalInPresentation = true
        parentTodayActivityDetailView.setup(vc: self, detail: detail)
        
        if detail is MirrorDetail {
            print("mirror")
        }
        else if detail is RoutineDetail {
            print("routine")
        }
    }

    override func loadView() {
        view = parentTodayActivityDetailView
    }

}
