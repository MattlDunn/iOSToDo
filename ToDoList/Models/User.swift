//
//  User.swift
//  ToDoList
//
//  Created by Matt Dunn on 2023-09-30.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
