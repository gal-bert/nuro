//
//  ParentTodayActivityViewController.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/10/22.
//

import UIKit

class ParentTodayActivityViewController: UIViewController {
    
    let parentTodayActivityView = ParentTodayActivityView()

    override func viewDidLoad() {
        super.viewDidLoad()
        parentTodayActivityView.setup()
        // Do any additional setup after loading the view.
    }
    
    override func loadView() {
        self.view = parentTodayActivityView
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
