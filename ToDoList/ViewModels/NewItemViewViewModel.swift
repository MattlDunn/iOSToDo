//
//  NewItemViewViewModel.swift
//  ToDoList
//
//  Created by Matt Dunn on 2023-09-30.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewViewModel:ObservableObject {
    @Published var title = ""
    @Published var due = Date()
    @Published var showAlert = false
    
    init() {}
    
    func save() {
        guard canSave else { // mostly redundant
            return
        }
        
        // Get current user id
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(id: newId,
                                   title: title,
                                   due: due.timeIntervalSince1970,
                                   created: Date().timeIntervalSince1970,
                                   isDone: false)
        
        
        // Save model to db
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDict())
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        // -86400 -> 86400 is the number of seconds in a day
        // date must be >= yesteday
        // not perfect, but mostly works
        guard due >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
