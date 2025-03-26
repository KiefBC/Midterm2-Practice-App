//
//  Addressbook.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//

import SwiftUI
import SwiftData

@Model
class Addressbook: Identifiable {
    var id: UUID = UUID()
    var name: String
    var email: String
    
    init(name: String, email: String) {
        self.name = name
        self.email = email
    }
}
