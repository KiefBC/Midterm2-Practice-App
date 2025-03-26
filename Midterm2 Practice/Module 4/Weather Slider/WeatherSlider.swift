//
//  WeatherSlider.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//

import SwiftUI
import Observation

@Observable
class Weather: Identifiable {
    var id: UUID = UUID()
    var weather: String = ""
}
