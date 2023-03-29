//
//  ContentView.swift
//  ToDoApp
//
//  Created by Arturo Sanchez on 28/03/23.
//

import SwiftUI

struct TodoItem: Identifiable {
    let id = UUID()
    let task: String
}

struct TodoList: View {
    @State var items = [TodoItem]()
    @State var newTask = ""
    
    var body: some View{
        VStack {
            Text("ToDo List")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding(.top, 50)
                .foregroundColor(Color.teal)
            
            HStack{
                TextField("New task", text: $newTask)
                    .padding(.all)
                    .background(Color.blue.opacity(0.4))
                    .cornerRadius(25)
                    .accentColor(.teal)
                Button(action: addTask){
                    Text("Add")
                        .foregroundColor(Color.blue.opacity(0.7))
                }
            }
            .padding()
            
            VStack{
                List(items) { item in
                    HStack{
                        Text(item.task)
                            .foregroundColor(Color.teal
                            )
                        Spacer()
                        Button(action: {removeTask(item) }) {
                            Image(systemName: "trash")
                                .foregroundColor(.blue)
                        }
                        
                    }
                }
            }
            
        }
        
        .background(Color.teal.opacity(0.3))
    }
    
    func addTask(){
        if !newTask.isEmpty {
            items.append(TodoItem(task: newTask))
            newTask = ""
        }
    }
    
    func removeTask(_ item: TodoItem) {
        items.removeAll{ $0.id == item.id}
    }
}

struct ContentView: View{
    var body: some View{
        TodoList()
    }
}

struct ContentView_Previews : PreviewProvider{
    static var previews: some View{
        ContentView()
    }
    
}
