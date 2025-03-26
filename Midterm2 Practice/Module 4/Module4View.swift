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
                }
            Spacer()
            Text("The Methodology is:")
            Text("1) Create Class")
            Text("2) Create Main View")
            Text("3) Create Row View")
            Text("4) Create Item Row View")
            Text("5) Create Detail (Info) View")
            Spacer()
        }
    }
}

#Preview {
    Module4View()
}
