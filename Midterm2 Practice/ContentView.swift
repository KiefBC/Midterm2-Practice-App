//
//  ContentView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-22.
//

import SwiftUI

struct ContentView: View {
    /// The array that keeps track of user-added logos.
    @State private var logos: [Logo] = []

    var body: some View {
        NavigationStack {
            HStack {
                NavigationLink(destination: BooleanView()) {
                    Text("Booleans")
                        .padding()
                }
                NavigationLink(destination: Module1View()) {
                    Text("Module 1")
                        .padding()
                }
                NavigationLink(destination: Module2View()) {
                    Text("Module 2")
                        .padding()
                }
                NavigationLink(destination: Module4View()) {
                    Text("Module 4")
                        .padding()
                }
            }
            HStack {
                NavigationLink(destination: Module5View()) {
                    Text("Module 5")
                        .padding()
                }
            }

            LogoDetailView(logos: $logos)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: addLogo) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }


    /// Adds a random logo to the list of logos with a random color applied
    private func addLogo() {
        let options: [String] = ["xbox.logo", "playstation.logo", "apple.logo", "gamecontroller.fill", "formfitting.gamecontroller.fill"]
        let randomLogo: String = options.randomElement()!
        let randomColor: Color = Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
        let newLogo: Logo = Logo(name: randomLogo, color: randomColor)
        logos.append(newLogo)
    }

}

#Preview {
    ContentView()
}
