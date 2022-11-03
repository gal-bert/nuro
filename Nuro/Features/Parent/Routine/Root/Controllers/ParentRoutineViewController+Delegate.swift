//
//  ParentRoutineViewController+Delegate.swift
//  Nuro
//
//  Created by Samuel Dennis on 05/10/22.
//

import UIKit

extension ParentRoutineViewController: ReloadDelegate {
    func reloadView() {
        viewModel.loadActivities(dayId: parentRoutineView.segmentedControl.selectedSegmentIndex+1)
        parentRoutineView.tableView.reloadData()
    }
}

extension ParentRoutineViewController: ParentRoutineDelegate {
    func loadActivitiesForDay(dayId: Int) {
        viewModel.loadActivities(dayId: dayId)
    }
    
    func presentViewController(dest: UIViewController) {
        let vc = UINavigationController(rootViewController: dest)
        vc.modalPresentationStyle = .formSheet
        vc.preferredContentSize = .init(width: ScreenSizes.modalWidth, height: ScreenSizes.modalHeight)
        present(vc, animated: true)
    }
}

extension ParentRoutineViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = parentRoutineView.tableView.dequeueReusableCell(withIdentifier: ActivitiesTableViewCell.identifier) as! ActivitiesTableViewCell
        if indexPath.section == 0 {
            cell.configure(model: viewModel.morningActivities[indexPath.row].activity ?? Activity())
        } else if indexPath.section == 1 {
            cell.configure(model: viewModel.afternoonActivities[indexPath.row].activity ?? Activity())
        } else {
            cell.configure(model: viewModel.eveningActivities[indexPath.row].activity ?? Activity())
        }

        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel.morningActivities.count
        } else if section == 1 {
            return viewModel.afternoonActivities.count
        } else {
            return viewModel.eveningActivities.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: HeaderTimeframeSection.identifier) as! HeaderTimeframeSection
        
        switch section {
        case 0:
            view.timeframeLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.morning, text: "Pagi", colorName: Colors.Text.onyx)
            
        case 1:
            view.timeframeLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.afternoon, text: "Siang", colorName: Colors.Text.onyx)
            
        case 2:
            view.timeframeLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.night, text: "Malam", colorName: Colors.Text.onyx)
            
        default:
            view.timeframeLabel.text = "Empty"
        }
        
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        guard tableView.isEditing else { return .none }
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            let alert = Alert.destructiveAlert(title: "", message: "Apakah anda ingin menghapus \(viewModel.getActivityNameFromCell(section: indexPath.section, row: indexPath.row)) dari rutinitas ini?") {
                //TODO: Add delete functions here
                RoutineDetailLocalRepository.shared.delete(routineDetail: self.viewModel.getRoutineDetail(section: indexPath.section, row: indexPath.row))
                self.viewModel.loadActivities(dayId: self.parentRoutineView.segmentedControl.selectedSegmentIndex+1)
                self.parentRoutineView.tableView.reloadData()
            }
            present(alert, animated: true)
        }
    }
    
}

extension ParentRoutineViewController : UITableViewDragDelegate {
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        let dragItem = UIDragItem(itemProvider: NSItemProvider())
//        dragItem.localObject = arr[indexPath.row]
        return [dragItem]
        
        // TODO: Implement array changes and save to coredata
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let mv = arr[sourceIndexPath.row]
//        arr.remove(at: sourceIndexPath.row)
//        arr.insert(mv, at: destinationIndexPath.row)
        // TODO: Implement array changes and save to coredata
    }
    
}



