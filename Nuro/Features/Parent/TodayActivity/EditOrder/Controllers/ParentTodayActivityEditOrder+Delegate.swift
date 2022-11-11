//
//  ParentTodayActivityEditOrderDelegate.swift
//  Nuro
//
//  Created by Gregorius Albert on 18/10/22.
//

import UIKit

extension ParentTodayActivityEditOrderViewController: AddActivityToRoutineDelegate {
    func addActivityToRoutine(activity: Activity) {
        let timeId = mirrorDetails[0].mirrorHeader?.timeID
        MirrorDetailLocalRepository.shared.add(timeID: Int(timeId!), activity: activity)
        mirrorDetails = MirrorDetailLocalRepository.shared.getMirrorDetails(timeID: Int(timeId!))
        parentTodayActivityEditOrderView.tableView.reloadData()
    }
}

extension ParentTodayActivityEditOrderViewController: ParentTodayActivityEditOrderDelegate {
    func dismissViewController() {
        self.dismiss(animated: true)
        reloadDelegate.reloadView()
    }
    
    func pushViewController() {
        let dest = AddActivityViewController()
        dest.delegate = self
        navigationController?.pushViewController(dest, animated: true)
    }
}


extension ParentTodayActivityEditOrderViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = parentTodayActivityEditOrderView.tableView.dequeueReusableCell(withIdentifier: ActivitiesTableViewCell.identifier) as! ActivitiesTableViewCell
        
        let activity = mirrorDetails[indexPath.row].activity
        
        cell.configure(model: activity ?? Activity())
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mirrorDetails.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = Alert.destructiveAlert(title: "", message: "Apakah anda ingin menghapus { } dari rutinitas ini?") {
                
//                RoutineDetailLocalRepository.shared.delete(routineDetail: self.mirrorDetails[indexPath.row])
                MirrorDetailLocalRepository.shared.delete(mirrorDetail: self.mirrorDetails[indexPath.row])
                self.dismissViewController()
            }
            present(alert, animated: true)
        }
    }
    
}

extension ParentTodayActivityEditOrderViewController : UITableViewDragDelegate {
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
        dragItem.localObject = mirrorDetails[indexPath.row]
        return [dragItem]
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let mv = mirrorDetails[sourceIndexPath.row]
        mirrorDetails.remove(at: sourceIndexPath.row)
        mirrorDetails.insert(mv, at: destinationIndexPath.row)
        
//        let routineDetailLocalRepo = RoutineDetailLocalRepository.shared
        let mirrorDetailLocalRepo = MirrorDetailLocalRepository.shared
        
        for (index, mirror) in mirrorDetails.enumerated() {
//            routineDetailLocalRepo.updatePosition(routineDetail: routine, newPosition: index+1)
            mirrorDetailLocalRepo.updatePosition(mirrorDetail: mirror, newPosition: index+1)
        }
    }
    
}
