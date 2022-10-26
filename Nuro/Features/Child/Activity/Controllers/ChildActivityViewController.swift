//
//  ChildActivityViewController.swift
//  Nuro
//
//  Created by Karen Natalia on 26/10/22.
//

import UIKit

class ChildActivityViewController: UIViewController {

    private let childActivityView = ChildActivityView()
    var activity: Activity?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        activity = RoutineDetailLocalRepository.shared.getRoutineDetails(dayID: 1, timeID: 1)[0].activity
        childActivityView.setup(model: activity ?? Activity())
    }

    override func loadView() {
        self.view = childActivityView
    }
}
