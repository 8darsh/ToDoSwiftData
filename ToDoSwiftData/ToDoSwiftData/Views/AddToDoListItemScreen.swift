//
//  AddToDoListItemScreen.swift
//  ToDoSwiftData
//
//  Created by Adarsh Singh on 16/05/24.
//

import SwiftUI

struct AddToDoListItemScreen: View {
    
    @State var name = ""
    @State private var noteDescription = ""
    
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) private var dismiss
    
    private var isFormValid: Bool{
        !name.isEmpty && !noteDescription.isEmpty
    }
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Title", text: $name)
                TextField("Note", text: $noteDescription)
                
                Button("Save") {
                    let todo = ToDo(name: name, note: noteDescription)
                    
                    context.insert(todo)
                    
                    do{
                        try context.save()
                    }catch{
                        print(error.localizedDescription)
                    }
                    dismiss()
                }.disabled(!isFormValid)
            }
            .navigationTitle("Add ToDo Item")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Close"){
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    AddToDoListItemScreen()
}
