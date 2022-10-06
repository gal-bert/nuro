//
//  ParentTodayActivityViewController.swift
//  Nuro
//
//  Created by Gregorius Albert on 04/10/22.
//

import UIKit

class ParentTodayActivityViewController: UIViewController {
    
    let parentTodayActivityView = ParentTodayActivityView()
    let viewModel = ParentTodayActivityViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        parentTodayActivityView.setup(vc: self)
    }
    
    override func loadView() {
        self.view = parentTodayActivityView
    }
}

extension ParentTodayActivityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = parentTodayActivityView.tableView.dequeueReusableCell(withIdentifier: "cell")!
        cell.textLabel?.text = viewModel.loadTableView()[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.loadTableView().count
    }
}
