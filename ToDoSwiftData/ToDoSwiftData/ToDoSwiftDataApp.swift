//
//  ToDoSwiftDataApp.swift
//  ToDoSwiftData
//
//  Created by Adarsh Singh on 16/05/24.
//

import SwiftUI
import SwiftData
@main
struct ToDoSwiftDataApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: ToDo.self)
    }
}
