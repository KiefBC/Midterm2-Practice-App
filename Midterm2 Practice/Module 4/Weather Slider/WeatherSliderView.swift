//
//  WeatherSliderView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-25.
//

import SwiftUI

struct WeatherSliderView: View {
    @State var weathers: [Weather] = []
    
    var body: some View {
        NavigationStack {
            VStack {
                WeatherSliderRowView(weathers: $weathers)
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("New Row", systemImage: "plus") {
                        addItem()
                    }
                }
            }
            .navigationBarTitle("Weather Slider")
        }
    }
    
    func addItem() {
        let newWeather: Weather = Weather()
        weathers.append(newWeather)
    }
}

#Preview {
    WeatherSliderView()
}
