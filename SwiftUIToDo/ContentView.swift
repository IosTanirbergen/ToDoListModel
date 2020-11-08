//
//  ContentView.swift
//  SwiftUIToDo
//
//  Created by Devnull on 11/8/20.
//

import SwiftUI

struct ToDoListItem: Identifiable {
    var id = UUID()
    var action: String
}

class ToDoList: ObservableObject {
   @Published var items: [ToDoListItem] = []
}


struct ContentView: View {
    
  @ObservedObject var viewModel: ToDoList = ToDoList()

    
    var body: some View {
        NavigationView {
            VStack{
                List(viewModel.items) {
                    item in
                    Text(item.action)
                }
            }
            .navigationTitle("To Do List")
            .navigationBarItems(trailing: Button(action: {
                
                self.viewModel.items = [
                    ToDoListItem(action: "GO Running"),
                    ToDoListItem(action: "Test Ios"),
                    ToDoListItem(action: "Play CsGo"),
                    ToDoListItem(action: "Running")
                ]
                
                
            }, label: {
                Text("Refresh")
            }))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
