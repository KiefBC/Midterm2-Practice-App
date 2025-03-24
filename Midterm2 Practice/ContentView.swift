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
    
    /// The edit mode for the list of logos.
    @State private var editMode: EditMode = .inactive
    
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
            .environment(\.editMode, $editMode)
        }
        .preferredColorScheme(.dark)
    }
    
    
    /// Adds a random logo to the list of logos
    private func addLogo() {
        let options = ["xbox.logo", "playstation.logo", "apple.logo"]
        let randomLogo = options.randomElement()!
        let randomColor = Color(
            red: Double.random(in: 0...1),
            green: Double.random(in: 0...1),
            blue: Double.random(in: 0...1)
        )
        let newLogo = Logo(name: randomLogo, color: randomColor)
        logos.append(newLogo)
    }
    
}

#Preview {
    ContentView()
}
