//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Matt Dunn on 2023-09-30.
//

import FirebaseCore
import SwiftUI

@main
struct ToDoListApp: App {
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
