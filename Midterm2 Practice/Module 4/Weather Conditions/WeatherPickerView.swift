//
//  Picker.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//
import SwiftUI

struct WeatherPickerView: View {
    let weatherConditions: [String] = ["sun.max", "moon.fill", "sun.snow.fill"]
    @State var selectedWeatherCondition: String = "sun.max"
    
    var body: some View {
        Picker("Weather Condition", selection: $selectedWeatherCondition) {
            ForEach(weatherConditions, id: \.self) { weather in
                Image(systemName: weather)
            }
        }
        .pickerStyle(.segmented)
    }
}

#Preview {
    WeatherPickerView()
}
