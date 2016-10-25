//
//  TaskManager.swift
//  TooDoooooooes
//
//  Created by Ludovic Ollagnier on 11/10/2016.
//  Copyright © 2016 Tec-Tec. All rights reserved.
//

import Foundation

class TaskManager {

    static let instance = TaskManager()

    private var tasks: [Task]

    var allTasks: [Task] {
        return tasks
    }

    var tasksByPriority: [Task] {
        let orderedTasks = tasks.sorted() { (t1, t2) -> Bool in
            return t1.priority.rawValue < t2.priority.rawValue
        }
        return orderedTasks
    }

    var tasksByDate: [Task] {
        let orderedTasks = tasks.sorted() { (t1, t2) -> Bool in
            return t1.dueDate < t2.dueDate
        }
        return orderedTasks
    }

    private init() {
        tasks = []
    }

    func add(_ task: Task) {
        tasks.append(task)
        print("J'ai ajouté \(task)")
    }
}
