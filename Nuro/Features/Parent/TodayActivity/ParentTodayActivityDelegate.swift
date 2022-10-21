//
//  ParentTodayActivity+Delegate.swift
//  Nuro
//
//  Created by Gregorius Albert on 05/10/22.
//

import UIKit

protocol ParentTodayActivityDelegate {
    func presentViewController(dest: UIViewController)
}

protocol ParentTodayActivityEditOrderDelegate {
    func dismissViewController()
    func pushViewController(dest: UIViewController)
}
