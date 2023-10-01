//
//  ToDoListItem.swift
//  ToDoList
//
//  Created by Matt Dunn on 2023-09-30.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let due: TimeInterval
    let created: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}

