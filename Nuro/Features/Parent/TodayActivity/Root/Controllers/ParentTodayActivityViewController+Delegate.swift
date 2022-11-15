//
//  ParentTodayActivityViewController+Delegate.swift
//  Nuro
//
//  Created by Gregorius Albert on 05/10/22.
//

import UIKit

extension ParentTodayActivityViewController: ReloadDelegate {
    func reloadView() {
        viewModel.loadAll(dayId: Date().getCurrentWeekday())
        parentTodayActivityView.tableView.reloadData()
    }
}

extension ParentTodayActivityViewController: ParentTodayActivityDelegate {

    func presentViewController(dest: UIViewController, modalHeight: CGFloat) {
        let vc = UINavigationController(rootViewController: dest)
        vc.modalPresentationStyle = .formSheet
        vc.preferredContentSize = .init(width: ScreenSizes.modalWidth, height: modalHeight)
        
        if let dest = dest as? ParentTodayActivityEditOrderViewController {
            dest.reloadDelegate = self
        }
        
        else if let dest = dest as? ParentTodayActivityDetailViewController {
            dest.reloadDelegate = self
        }
        
        present(vc, animated: true)
    }
    
}

extension ParentTodayActivityViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = parentTodayActivityView.tableView.dequeueReusableCell(withIdentifier: ParentTodayActivityTableViewCell.identifier) as! ParentTodayActivityTableViewCell
        
        cell.setupDelegate(vc: self)
        
        switch indexPath.section {
        case 0:
            cell.timeframeLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.morning, text: "Pagi", colorName: Colors.Text.onyx)
            cell.backgroundColor = Colors.Background.water
            cell.collectionView.backgroundColor = cell.backgroundColor
            cell.routines = viewModel.morningActivities
            cell.timeframe = 0
            
            if viewModel.morningActivities.count == 0 {
                cell.hiddenLabel.isHidden = false
                cell.collectionView.isHidden = true
            }
            
        case 1:
            cell.timeframeLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.afternoon, text: "Siang", imageHeight: 40, yOffset: -8, colorName: Colors.Text.onyx)
            cell.backgroundColor = Colors.Background.papayaWhip
            cell.collectionView.backgroundColor = cell.backgroundColor
            cell.routines = viewModel.afternoonActivities
            cell.timeframe = 1
            
            if viewModel.afternoonActivities.count == 0 {
                cell.hiddenLabel.isHidden = false
                cell.collectionView.isHidden = true
            }
            
        case 2:
            cell.timeframeLabel.attributedText = TextAttachments.leadingAttachment(imageName: Icons.night, text: "Malam", colorName: Colors.Text.onyx)
            cell.backgroundColor = Colors.Background.soap
            cell.collectionView.backgroundColor = cell.backgroundColor
            cell.routines = viewModel.eveningActivities
            cell.timeframe = 2
            
            if viewModel.eveningActivities.count == 0 {
                cell.hiddenLabel.isHidden = false
                cell.collectionView.isHidden = true
            }

        default:
            cell.timeframeLabel.text = "Empty"
        }
        
        cell.collectionView.reloadData()
        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.section == 0, viewModel.morningActivities.count == 0{
            return 100
        }
        else if indexPath.section == 1, viewModel.afternoonActivities.count == 0{
            return 100
        }
        else if indexPath.section == 2, viewModel.eveningActivities.count == 0{
            return 100
        }
        
        return CGFloat(CollectionViewAttributes.collectionViewCellHeight) + 110.0
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 24
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
    }
    
}
