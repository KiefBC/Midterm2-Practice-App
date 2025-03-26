//
//  WeatherConditionRowView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//

import SwiftUI

struct WeatherConditionRowView: View {
    @Binding var weatherCondition: [WeatherCondition]
    
    var body: some View {
        List {
            ForEach($weatherCondition) { $condition in
                WeatherConditionItemView(weatherCondition: $condition)
            }
        }
    }
}

#Preview {
    WeatherConditionRowView(weatherCondition: .constant([WeatherCondition()]))
}
