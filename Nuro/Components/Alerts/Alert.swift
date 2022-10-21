//
//  Alert.swift
//  Nuro
//
//  Created by Gregorius Albert on 20/10/22.
//

import UIKit

class Alert {
    
    static func infoAlert(title: String, message:String) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .cancel,
            handler: nil
        ))
        alert.view.tintColor = Colors.Brand.blueViolet
        return alert
    }
    
    static func destructiveAlert(title: String, message:String, onDelete: @escaping () -> Void) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(
            title: "Batal",
            style: .cancel,
            handler: nil
        ))
        
        alert.addAction(UIAlertAction(
            title: "Hapus",
            style: .destructive,
            handler: { _ in
                onDelete()
            }
        ))
        
        return alert
    }
    
}
