//
//  Notepad.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-26.
//

import SwiftUI
import SwiftData

@Model
class Notepad: Identifiable {
    var id: UUID
    var content: String
    var date: Date
    var title: String
    
    init(content: String, title: String, id: UUID = UUID(), date: Date = Date()) {
        self.id = id
        self.content = content
        self.title = title
        self.date = date
    }
}
