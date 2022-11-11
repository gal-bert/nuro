//
//  SearchControllerDelegate.swift
//  Nuro
//
//  Created by Gregorius Albert on 24/10/22.
//

import UIKit

protocol SearchControllerDelegate {
    func getResult(text: String)
    func filtered(searchText: String)
}


