//
//  ToDoDetailScreen.swift
//  ToDoSwiftData
//
//  Created by Adarsh Singh on 16/05/24.
//

import SwiftUI
import SwiftData
struct ToDoDetailScreen: View {
    @State private var name: String = ""
    @State private var note: String = ""
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    let todo: ToDo
    
    var body: some View {
        Form {
                TextField("Name", text: $name)
                TextField("Note description", text: $note)
                Button("Update") {
                    todo.name = name
                    todo.note = note
                    do {
                        try context.save()
                    } catch {
                    print(error.localizedDescription)
                    }
                    dismiss()
                }.onAppear{
                    name = todo.name
                    note = todo.note
                }
            }
    }
}

#Preview {
    ToDoDetailScreen(todo:ToDo(name: "Adarsh", note: "GIGI"))
}
