//
//  ToDo.swift
//  ToDoSwiftData
//
//  Created by Adarsh Singh on 16/05/24.
//

import Foundation
import SwiftData

@Model
final class ToDo:Identifiable{
    
    @Attribute(.unique) var id: String = UUID().uuidString
    var name: String
    var note: String
    
    init(name: String, note: String) {
        self.name = name
        self.note = note
    }
    
}
