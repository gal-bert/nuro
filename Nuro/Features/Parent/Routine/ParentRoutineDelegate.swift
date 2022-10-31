//
//  ParentRoutineDelegate.swift
//  Nuro
//
//  Created by Samuel Dennis on 05/10/22.
//

import UIKit

protocol ParentRoutineDelegate {
    func presentViewController(dest: UIViewController)
    func loadActivitiesForDay(dayId: Int)
}

protocol ParentRoutineAddActivityDelegate {
    func dismissViewController()
    func pushViewController(dest: UIViewController)
}

protocol ParentRoutineAddActivityRoutineTimeDelegate {
    func popViewController()
    func pushViewController(dest: UIViewController)
}
