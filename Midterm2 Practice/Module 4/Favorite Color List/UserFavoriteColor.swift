//
//  UserFavoriteColor.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//


import SwiftUI

@Observable
class UserFavoriteColor: Identifiable {
    var id: UUID
    var name: String
    var color: Color
    
    init(id: UUID = UUID(), name: String, color: Color) {
        self.id = id
        self.name = name
        self.color = color
    }
}
