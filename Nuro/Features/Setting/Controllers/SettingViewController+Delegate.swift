//
//  SettingViewController+Delegate.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 03/11/22.
//

import UIKit

extension SettingViewController: SettingDelegate {
    func printText(text: String) {
        viewModel.printText(text: text)
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case settingView.tableViewProfile:
            return 2
        case settingView.tableViewTime:
            return 3
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch tableView {
        case settingView.tableViewProfile:
            let cell = settingView.tableViewProfile.dequeueReusableCell(withIdentifier: SettingParentChildTableViewCell.identifier) as! SettingParentChildTableViewCell
            cell.textField.text = ""
            cell.textField.placeholder = "enter the text"
            return cell
        case settingView.tableViewTime:
            let cell = settingView.tableViewTime.dequeueReusableCell(withIdentifier: SettingTimeTableViewCell.identifier) as! SettingTimeTableViewCell
            return cell
        default:
            print("Something wrong")
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView {
        case settingView.tableViewProfile:
            return 55
        case settingView.tableViewTime:
            return 55
        default:
            return 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case settingView.tableViewProfile:
            print(indexPath.row)
            let cell = tableView.cellForRow(at: indexPath) as! SettingParentChildTableViewCell
            cell.textField.becomeFirstResponder()
        case settingView.tableViewTime:
            print(indexPath.row)
            let cell = tableView.cellForRow(at: indexPath) as! SettingTimeTableViewCell
            cell.timePicker.becomeFirstResponder()
        default:
            return 
        }
        
    }
    
    
}

