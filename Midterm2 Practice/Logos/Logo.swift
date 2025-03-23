//
//  Logos.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-23.
//

import Foundation
import SwiftUI

struct Logo: Identifiable {
    var id = UUID()
    var name: String
    var date: Date = Date()
    var userTitle: String = "Name Me"
    var color: Color
    
    private func randomColor() -> Color {
        let colors: [Color] = [.red, .green, .blue, .yellow, .orange, .purple, .pink]
        return colors.randomElement()!
    }
}
