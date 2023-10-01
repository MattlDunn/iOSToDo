//
//  LoginViewViewModel.swift
//  ToDoList
//
//  Created by Matt Dunn on 2023-09-30.
//

import FirebaseAuth
import Foundation

class LoginViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var passwd = ""
    @Published var errorMsg = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        // Try log in
        Auth.auth().signIn(withEmail: email, password: passwd)
    }
    
    private func validate() -> Bool {
        errorMsg = ""
        
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !passwd.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMsg = "Please fill in all fields."
            return false
        }
        
        guard email.contains("@"), email.contains(".") else {
            errorMsg = "Please enter a valid email."
            return false
        }

        return true
    }
}
