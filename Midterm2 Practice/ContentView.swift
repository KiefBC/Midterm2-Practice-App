//
//  ContentView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-22.
//

import SwiftUI

//struct ContentView: View {
//    @State private var logos: [Logo] = []
//
//    var body: some View {
//        TabView {
//            BooleanView()
//                .tabItem {
//                    Label("Booleans", systemImage: "switch.2")
//                }
//
//            Module1View()
//                .tabItem {
//                    Label("Module 1", systemImage: "1.circle")
//                }
//
//            Module2View()
//                .tabItem {
//                    Label("Module 2", systemImage: "2.circle")
//                }
//
//            Module4View()
//                .tabItem {
//                    Label("Module 4", systemImage: "4.circle")
//                }
//
//            Module5View()
//                .tabItem {
//                    Label("Module 5", systemImage: "5.circle")
//                }
//
//            NavigationStack {
//                LogoDetailView(logos: $logos)
//                    .toolbar {
//                        ToolbarItem(placement: .navigationBarTrailing) {
//                            EditButton()
//                        }
//                        ToolbarItem(placement: .navigationBarLeading) {
//                            Button(action: addLogo) {
//                                Image(systemName: "plus")
//                            }
//                        }
//                        ToolbarItem(placement: .topBarTrailing) {
//                            // Button to take user to SettingsView()
//                        }
//                    }
//            }
//            .tabItem {
//                Label("Logos", systemImage: "star")
//            }
//        }
////        .preferredColorScheme(.dark)
//    }
//
//    private func addLogo() {
//        let options: [String] = ["xbox.logo", "playstation.logo", "apple.logo", "gamecontroller.fill", "formfitting.gamecontroller.fill"]
//        let randomLogo: String = options.randomElement()!
//        let randomColor: Color = Color(
//            red: Double.random(in: 0...1),
//            green: Double.random(in: 0...1),
//            blue: Double.random(in: 0...1)
//        )
//        let newLogo: Logo = Logo(name: randomLogo, color: randomColor)
//        logos.append(newLogo)
//    }
//}

struct ContentView: View {
    /// The array that keeps track of user-added logos.
    @State private var logos: [Logo] = []

    var body: some View {
        NavigationStack {
            HStack {
                NavigationLink(destination: BooleanView()) {
                    Text("Booleans")
                }
                NavigationLink(destination: Module1View()) {
                    Text("Module 1")
                }
                NavigationLink(destination: Module2View()) {
                    Text("Module 2")
                }
                NavigationLink(destination: Module4View()) {
                    Text("Module 4")
                }
            }
            HStack {
                NavigationLink(destination: Module5View()) {
                    Text("Module 5")
                }
                NavigationLink(destination: FinalStuff()) {
                    Text("Final Stuff")
                }
            }

            LogoDetailView(logos: $logos)
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear")
                        }
                    }
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
