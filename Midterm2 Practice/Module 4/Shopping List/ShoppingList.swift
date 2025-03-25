//
//  ShoppingList.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//


import SwiftUI
import Observation

@Observable
class ShoppingList: Identifiable {
    var id: UUID
    var name: String = "Shopping List Item"
    
    init(id: UUID = UUID(), name: String) {
        self.id = id
        self.name = name
    }
}