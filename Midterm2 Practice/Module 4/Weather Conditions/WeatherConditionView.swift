//
//  WeatherConditionView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//

import SwiftUI

struct WeatherConditionView: View {
    @State var weatherCondition: [WeatherCondition] = [WeatherCondition]()
    
    var body: some View {
        NavigationStack {
            VStack {
                WeatherConditionRowView(weatherCondition: $weatherCondition)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add New Row", systemImage: "plus") {
                        addWeatherCondition()
                    }
                }
            }
        }
    }
    
    private func addWeatherCondition() {
        let newWeatherCondition: WeatherCondition = WeatherCondition()
        weatherCondition.append(newWeatherCondition)
    }
}

#Preview {
    WeatherConditionView()
}
