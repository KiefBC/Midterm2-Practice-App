//
//  Journal.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-26.
//

import SwiftUI
import SwiftData

@Model
class Journal: Identifiable {
    var id: UUID = UUID()
    var date: Date
    var event: String
    
    init(date: Date, event: String) {
        self.date = date
        self.event = event
    }
}
