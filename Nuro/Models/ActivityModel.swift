//
//  ActivityModel.swift
//  Nuro
//
//  Created by Karen Natalia on 13/10/22.
//

import Foundation

struct ActivityModel {
    var activityName: String
    var activityDesc: String
    var activityImageURL: String
    var activityDuration: Int
    var createdAt: Date
    var category: CategoryModel
}
