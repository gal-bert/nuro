//
//  AddActivityViewController.swift
//  Nuro
//
//  Created by Gregorius Albert on 20/10/22.
//

import UIKit

class AddActivityViewController: UIViewController {

    let addActivityView = AddActivityView()
    let viewModel = AddActivityViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preferredContentSize = .init(width: ScreenSizes.modalWidth, height: ScreenSizes.modalHeight)

        addActivityView.setup(vc: self)
        viewModel.loadSegmentedControlItems(vc: self)
    }
    
    override func loadView() {
        self.view = addActivityView
    }


}
