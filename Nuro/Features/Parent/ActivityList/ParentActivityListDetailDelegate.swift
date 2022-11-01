//
//  ParentActivityListDetailDelegate.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 18/10/22.
//

import UIKit

protocol ParentActivityListDetailDelegate {
    func presentViewController(dest: UIViewController)
    func getCategory() -> Category
}
