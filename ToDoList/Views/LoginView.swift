//
//  LoginView.swift
//  ToDoList
//
//  Created by Matt Dunn on 2023-09-30.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel = LoginViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                // Header
                HeaderView(title: "To Do List",
                           subtitle: "Get things done",
                           angle: 15,
                           background: .pink)
                
                // Login Form
                Form {
                    if !viewModel.errorMsg.isEmpty {
                        Text(viewModel.errorMsg)
                            .foregroundColor(.red)
                    }
                    
                    TextField("Email Address", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.passwd)
                        .textFieldStyle(DefaultTextFieldStyle())
                    
                    TLButton(title: "Log In", background: .blue) {
                        viewModel.login()
                    }
                }
                .offset(y: -100)
                
                // Create Account
                VStack {
                    Text("No account yet?")
                    NavigationLink("Sign Up", destination: RegisterView())
                }
                    .padding(.bottom, 25)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LoginView()
                .preferredColorScheme(.light)
            .previewInterfaceOrientation(.portrait)
            LoginView()
                .preferredColorScheme(.dark)
                .previewInterfaceOrientation(.portrait)
        }
    }
}
