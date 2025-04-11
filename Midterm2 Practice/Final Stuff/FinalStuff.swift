//
//  FinalStuff.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-04-11.
//

import SwiftUI

struct FinalStuff: View {
    var body: some View {
        NavigationStack {
            HStack {
                NavigationLink(destination: ExerciseOne()) {
                    Text("Exercise 1")
                }
                NavigationLink(destination: ExerciseTwo()) {
                    Text("Exercise 2")
                }
                NavigationLink(destination: ExerciseThree()) {
                    Text("Exercise 3")
                }
                NavigationLink(destination: ExerciseFour()) {
                    Text("Exercise 4")
                }
                NavigationLink(destination: ExerciseFive()) {
                    Text("Exercise 5")
                }
                NavigationLink(destination: ExerciseSix()) {
                    Text("Exercise 6")
                }
            }
            .navigationTitle("OI OI OI OI")
            .padding(.top)
            Spacer()
        }
    }
}

#Preview {
    FinalStuff()
}
