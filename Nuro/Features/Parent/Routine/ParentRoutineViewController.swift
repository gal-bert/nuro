//
//  ParentRoutineViewController.swift
//  Nuro
//
//  Created by Samuel Dennis on 05/10/22.
//

import UIKit

class ParentRoutineViewController: UIViewController {

    let parentRoutineView = ParentRoutineView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        parentRoutineView.setup(vc: self)
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        self.view = parentRoutineView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
