//
//  ContentView.swift
//  ToDoSwiftData
//
//  Created by Adarsh Singh on 16/05/24.
//

import SwiftUI
import SwiftData
struct ContentView: View {
    @State private var isPresented: Bool = false
    @Query private var todos: [ToDo]
    var body: some View {
        NavigationStack{
            VStack{
                ToDoListView(todos: todos)
                    .navigationTitle("TODO App")
                
            }
            .sheet(isPresented: $isPresented, content: {
                AddToDoListItemScreen()
            })
            .toolbar{
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        isPresented = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
