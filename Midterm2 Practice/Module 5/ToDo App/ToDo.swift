//
//  ToDo.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-26.
//

import SwiftUI
import SwiftData

@Model
class Todo: Identifiable {
    var id: UUID
    var name: String
    var isFinished: Bool
    
    init(id: UUID = UUID(), name: String, isFinished: Bool = false) {
        self.id = id
        self.name = name
        self.isFinished = isFinished
    }
}
