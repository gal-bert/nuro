//
//  AddActivityDelegate.swift
//  Nuro
//
//  Created by Gregorius Albert on 31/10/22.
//

import UIKit

protocol CreateActivityDelegate {
    func pushViewController(dest: UIImagePickerController, type: UIImagePickerController.SourceType)
    func pushSelectorAlert()
    func dismissViewController()
    func saveActivity(name: String, desc: String, image: UIImage)
    func validateFields()
}

protocol ReloadCreateActivity {
    func reloadData()
}
