//
//  WeatherCondition.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//

import SwiftUI
import Observation

@Observable
class WeatherCondition: Identifiable {
    var id: UUID
    var location: String = "Victoria"
    
    init(id: UUID = UUID()) {
        self.id = id
    }
}
