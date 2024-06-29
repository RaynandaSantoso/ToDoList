//
//  ToDoListitem.swift
//  Todo-list-app
//
//  Created by Raynanda on 07/06/24.
//

import Foundation

struct ToDoListitem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
