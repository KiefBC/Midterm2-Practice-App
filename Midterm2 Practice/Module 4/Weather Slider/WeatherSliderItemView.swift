//
//  WeatherSliderItemView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//
import SwiftUI

struct WeatherSliderItemView: View {
    @Binding var weather: Weather
    @State var sliderValue: Double = 0.0
    
    var body: some View {
        let weatherIcons: [String] = ["sun.max", "moon.fill", "cloud.fill", "sun.max.circle.fill", "sunrise.fill"]
        HStack {
            Image(systemName: weatherIcons[Int(sliderValue)])
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
            Slider(value: $sliderValue, in: 0...Double(weatherIcons.count - 1))
        }
    }
}
