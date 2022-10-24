//
//  ParentTodayActivityEditOrderDelegate.swift
//  Nuro
//
//  Created by Gregorius Albert on 18/10/22.
//

import UIKit

extension ParentTodayActivityEditOrderViewController: ParentTodayActivityEditOrderDelegate {
    func dismissViewController() {
        self.dismiss(animated: true)
    }
    
    func pushViewController(dest: UIViewController) {
        navigationController?.pushViewController(dest, animated: true)
    }
}


extension ParentTodayActivityEditOrderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = parentTodayActivityEditOrderView.tableView.dequeueReusableCell(withIdentifier: ActivitiesTableViewCell.identifier) as! ActivitiesTableViewCell
        
        let activity = activities[indexPath.row].activity
        
        cell.configure(model: activity ?? Activity())
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = Alert.destructiveAlert(title: "", message: "Apakah anda ingin menghapus { } dari rutinitas ini?") {
                //TODO: Add delete functions here
            }
            present(alert, animated: true)
        }
    }
    
    
    
}

extension ParentTodayActivityEditOrderViewController : UITableViewDragDelegate {
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = activities[indexPath.row]
        return [dragItem]
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let mv = activities[sourceIndexPath.row]
        activities.remove(at: sourceIndexPath.row)
        activities.insert(mv, at: destinationIndexPath.row)
    }
    
}
