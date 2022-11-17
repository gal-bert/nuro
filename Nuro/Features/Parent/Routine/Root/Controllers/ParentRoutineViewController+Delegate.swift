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
    
    func presentViewController(dest: UIViewController, modalHeight: CGFloat) {
        let vc = UINavigationController(rootViewController: dest)
        vc.modalPresentationStyle = .formSheet
        vc.preferredContentSize = .init(width: ScreenSizes.modalWidth, height: modalHeight)
        present(vc, animated: true)
//        coachMarksController.flow.showNext()
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
            view.timeframeLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.afternoon, text: "Siang", imageHeight: 40, yOffset: -8, colorName: Colors.Text.onyx)
            
        case 2:
            view.timeframeLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.night, text: "Malam", colorName: Colors.Text.onyx)
            
        default:
            view.timeframeLabel.text = "Empty"
        }
        
        return view
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dest = ParentTodayActivityDetailViewController()
        
        switch indexPath.section {
        case 0:
            dest.detail = viewModel.morningActivities[indexPath.row]
        case 1:
            dest.detail = viewModel.afternoonActivities[indexPath.row]
        case 2:
            dest.detail = viewModel.eveningActivities[indexPath.row]
        default:
            break
        }
        
        
        dest.reloadDelegate = self
        presentViewController(dest: dest, modalHeight: ScreenSizes.smallModalHeight)
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
            let alert = Alert.destructiveAlert(title: "", message: "Apakah anda ingin menghapus \"\(viewModel.getActivityNameFromCell(section: indexPath.section, row: indexPath.row))\" dari rutinitas ini?") {
                RoutineDetailLocalRepository.shared.delete(routineDetail: self.viewModel.getRoutineDetail(section: indexPath.section, row: indexPath.row))
                self.viewModel.loadActivities(dayId: self.parentRoutineView.segmentedControl.selectedSegmentIndex+1)
                self.parentRoutineView.tableView.deleteRows(at: [indexPath], with: .left)
                self.parentRoutineView.tableView.reloadData()
            }
            present(alert, animated: true)
        }
    }
    
}

extension ParentRoutineViewController : UITableViewDragDelegate {
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        
        if indexPath.section == 0 {
            let dragItem = UIDragItem(itemProvider: NSItemProvider())
            dragItem.localObject = viewModel.morningActivities[indexPath.row]
            return [dragItem]
        }
        else if indexPath.section == 1 {
            let dragItem = UIDragItem(itemProvider: NSItemProvider())
            dragItem.localObject = viewModel.afternoonActivities[indexPath.row]
            return [dragItem]
        }
        else {
            let dragItem = UIDragItem(itemProvider: NSItemProvider())
            dragItem.localObject = viewModel.eveningActivities[indexPath.row]
            return [dragItem]
        }
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        viewModel.moveRoutineDetail(source: sourceIndexPath, dest: destinationIndexPath)
    }
    
}



