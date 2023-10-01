//
//  ToDoListItemView.swift
//  ToDoList
//
//  Created by Matt Dunn on 2023-09-30.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewViewModel()
    let item: ToDoListItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .bold()
                    .font(.body)
                Text("\(Date(timeIntervalSince1970: item.due).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                // Check
                viewModel.toggleCheck(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.green)
            }
        }
    }
}

struct ToDoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ToDoListItemView(item: .init(id: "123",
                                     title: "Test ToDo",
                                     due: Date().timeIntervalSince1970,
                                     created: Date().timeIntervalSince1970,
                                     isDone: true))
    }
}
