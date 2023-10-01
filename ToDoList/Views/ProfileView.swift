//
//  ProfileView.swift
//  ToDoList
//
//  Created by Matt Dunn on 2023-09-30.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user: user)
                } else {
                    Text("Loading Profile...")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        // Avatar image
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding(.bottom, 50)
            .padding(.top, 25)
        
        // Info: Name, email, date joined
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            
            HStack {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
        }
        
        Spacer()
        
        // Sign out
        TLButton(title: "Log Out", background: .red) {
            // Logout
            viewModel.logout()
        }
        .frame(height: 75)
        .padding()
        .padding(.bottom, 50)

    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
