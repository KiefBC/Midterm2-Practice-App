//
//  WeatherSliderRowView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//

import SwiftUI

struct WeatherSliderRowView: View {
    @Binding var weathers: [Weather]
    
    var body: some View {
        ForEach($weathers) { $weather in
            VStack {
                WeatherSliderItemView(weather: $weather)
            }
        }
    }
}

#Preview {
    WeatherSliderRowView(weathers: .constant([Weather()]))
}
