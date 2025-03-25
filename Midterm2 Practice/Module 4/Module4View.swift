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
                }
            Spacer()
        }
    }
}

#Preview {
    Module4View()
}
