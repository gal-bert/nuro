//
//  ParentActivityListDelegate.swift
//  Nuro
//
//  Created by Finn Christoffer Kurniawan on 05/10/22.
//

import Foundation

protocol ParentActivityListDelegate {
    func printText(text: String)
}

protocol AddActivityDelegate {
    func updateSearchResults(text: String)
    func filterCategory()
}

protocol AddActivityToRoutineDelegate {
    func addActivityToRoutine(activity: Activity)
}
