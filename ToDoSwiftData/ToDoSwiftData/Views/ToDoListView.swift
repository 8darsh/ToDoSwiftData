//
//  ToDoListView.swift
//  ToDoSwiftData
//
//  Created by Adarsh Singh on 16/05/24.
//

import SwiftUI

struct ToDoListView: View {
    let todos: [ToDo]
    @Environment(\.modelContext) private var context
    
    private func deleteToDo(indexSet: IndexSet){
        indexSet.forEach { index in
            let todo = todos[index]
            context.delete(todo)
            
            do{
                try context.save()
            }
            catch{
                print(error.localizedDescription)
                
            }
            
        }
    }
    var body: some View {
        List{
            ForEach(todos,id: \.id) { todo in
                NavigationLink(value: todo) {
                    VStack(alignment: .leading, content: {
                        Text(todo.name)
                            .font(.title3)
                        
                        Text(todo.note)
                            .font(.caption)
                    })
                }
            }.onDelete(perform:deleteToDo)
        }.navigationDestination(for: ToDo.self) { todo in
            ToDoDetailScreen(todo: todo)
        }
    }
}

#Preview {
    ToDoListView(todos: [ToDo(name: "NAME", note: ":")])
}
