//
//  Module4View.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-24.
//

import SwiftUI

struct Module4View: View {
    var body: some View {
        NavigationStack {
                HStack {
                    NavigationLink(destination: ShoppingListView()) {
                        Text("Shopping List")
                            .padding()
                    }
                    NavigationLink(destination: FavoriteColorView()) {
                        Text("Favorite Color")
                            .padding()
                    }
                    NavigationLink(destination: WeatherConditionView()) {
                        Text("Weather Picker")
                            .padding()
                    }
                    NavigationLink(destination: WeatherSliderView()) {
                        Text("Weather Slider")
                            .padding()
                    }
                }
            Spacer()
            Text("The Methodology is:")
            Text("1) Create Class")
            Text("2) Create Main View ((Renders the List))")
            Text("3) Create Row View ((ForEach loop to render each item in the List))")
            Text("4) Create Item Row View ((Each item in the List))")
            Text("5) Create Detail (Info) View ((Detail view for each item in the List))")
            Spacer()
        }
    }
}

#Preview {
    Module4View()
}
