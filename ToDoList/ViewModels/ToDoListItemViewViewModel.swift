//
//  ToDoListItemViewViewModel.swift
//  ToDoList
//
//  Created by Matt Dunn on 2023-09-30.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewViewModel:ObservableObject {
    init() {}
    
    func toggleCheck(item: ToDoListItem) {
        var copy = item
        copy.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(copy.id)
            .setData(copy.asDict())
    }
}
