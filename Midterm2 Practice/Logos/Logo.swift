//
//  Logos.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-23.
//

import SwiftUI
import Observation

@Observable
class Logo: Identifiable {
    var id: UUID
    var name: String
    var date: Date
    var userTitle: String
    var color: Color

    init(name: String, color: Color, id: UUID = UUID(), date: Date = Date(), userTitle: String? = nil) {
        self.id = id
        self.name = name
        self.date = date
        self.userTitle = userTitle ?? name
        self.color = color
    }
}
