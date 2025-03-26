//
//  WeatherConditionItemView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//

import SwiftUI

struct WeatherConditionItemView: View {
    @Binding var weatherCondition: WeatherCondition
    
    var body: some View {
        HStack {
            TextField("Name Change", text: $weatherCondition.location)
            WeatherPickerView()
        }
    }
}

#Preview {
    WeatherConditionItemView(weatherCondition: .constant(WeatherCondition()))
}
