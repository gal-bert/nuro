//
//  SettingViewController+Delegate.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 03/11/22.
//

import UIKit

extension SettingViewController: SettingDelegate {
    func setTimepickerValue(value: String, tag: Int) {
        switch tag {
        case 0:
            UserDefaults.standard.set(value, forKey: UserDefaultsHelper.Keys.morningTime)
            settingView.tableViewTime.reloadRows(at: [IndexPath(row: 1, section: 0), IndexPath(row: 2, section: 0)], with: .none)
        case 1:
            UserDefaults.standard.set(value, forKey: UserDefaultsHelper.Keys.afternoonTime)
            settingView.tableViewTime.reloadRows(at: [IndexPath(row: 0, section: 0), IndexPath(row: 2, section: 0)], with: .none)

        case 2:
            UserDefaults.standard.set(value, forKey: UserDefaultsHelper.Keys.eveningTime)
            settingView.tableViewTime.reloadRows(at: [IndexPath(row: 0, section: 0), IndexPath(row: 1, section: 0)], with: .none)

        default:
            print("default")
        }
        
    }
}

extension SettingViewController: UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
        
        switch textField.tag {
        case 0:
            var text = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
            text = text == "" ? "Orang Tua" : text
            UserDefaults.standard.set(text, forKey: UserDefaultsHelper.Keys.parentsName)
        case 1:
            var text = ((textField.text ?? "") as NSString).replacingCharacters(in: range, with: string)
            text = text == "" ? "Anak" : text
            UserDefaults.standard.set(text, forKey: UserDefaultsHelper.Keys.kidsName)
        default:
            print("Other")
        }
        
        return true
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
            cell.textField.delegate = self
            switch indexPath.item {
            case 0:
                cell.titleLabel.text = "Nama Orang Tua"
                cell.textField.tag = indexPath.row
                cell.textField.text = UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.parentsName) ?? "Orang Tua"
                cell.textField.placeholder = "Masukkan nama anda"
            case 1:
                cell.titleLabel.text = "Nama Anak"
                cell.textField.tag = indexPath.row
                cell.textField.text = UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.kidsName) ?? "Anak"
                cell.textField.placeholder = "Masukkan nama anak anda"
            default:
                print("Loading Error")
            }
            return cell

        case settingView.tableViewTime:
            let cell = settingView.tableViewTime.dequeueReusableCell(withIdentifier: SettingTimeTableViewCell.identifier) as! SettingTimeTableViewCell
            cell.delegate = self
            switch indexPath.item {
            case 0:
                cell.titleLabel.text = "Pagi"
                cell.backgroundColor = Colors.Background.water
                cell.timePicker.tag = indexPath.row
                cell.timePicker.date = Date().formatForDatepicker(value: UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.morningTime)!)
                cell.timePicker.minimumDate = Date().formatForDatepicker(value: "00:00")
                cell.timePicker.maximumDate = Date().formatForDatepicker(value: UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.afternoonTime)!)
            case 1:
                cell.titleLabel.text = "Siang"
                cell.backgroundColor = Colors.Background.papayaWhip
                cell.timePicker.tag = indexPath.row
                cell.timePicker.date = Date().formatForDatepicker(value: UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.afternoonTime)!)
                cell.timePicker.minimumDate = Date().formatForDatepicker(value: UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.morningTime)!)
                cell.timePicker.maximumDate = Date().formatForDatepicker(value: UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.eveningTime)!)
            case 2:
                cell.titleLabel.text = "Malam"
                cell.backgroundColor = Colors.Background.soap
                cell.timePicker.tag = indexPath.row
                cell.timePicker.date = Date().formatForDatepicker(value: UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.eveningTime)!)
                cell.timePicker.minimumDate = Date().formatForDatepicker(value: UserDefaults.standard.string(forKey: UserDefaultsHelper.Keys.afternoonTime)!)
                cell.timePicker.maximumDate = Date().formatForDatepicker(value: "23:59")
                

            default:
                print("Loading Error")
            }
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

