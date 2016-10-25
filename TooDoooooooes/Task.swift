//
//  Task.swift
//  TooDoooooooes
//
//  Created by Ludovic Ollagnier on 11/10/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import Foundation

struct Task {

    enum Priority: Int {
        case low = 0
        case normal = 1
        case high = 2
    }

    enum TaskType {
        case personal
        case professional
    }

    let name: String
    let description: String

    let dueDate: Date
    var priority: Priority = Priority.normal
    let type: TaskType
    var imageURL: URL?

    init(name: String, description: String, dueDate: Date, priority: Priority, type: TaskType, imageURL: URL? = nil) {
        self.name = name
        self.description = description
        self.dueDate = dueDate
        self.priority = priority
        self.type = type
        self.imageURL = imageURL
    }
}
