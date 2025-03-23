//
//  ContentView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-22.
//

import SwiftUI

struct ContentView: View {
    @State var logos: [Logos] = [
        Logos(name: "xbox.logo"),
        Logos(name: "playstation.logo"),
        Logos(name: "apple.logo"),
    ]
    
//    @State var logos: [Logos] = [Logos()]
    
    var body: some View {
        NavigationStack {
            Text("Midterm 2 Practice")
                .font(.title)
                .padding()
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
            List {
                ForEach($logos) { $logo in
                    NavigationLink(destination: LogosRowView(logos: $logo)) {
                        LogosView(logos: $logo)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
