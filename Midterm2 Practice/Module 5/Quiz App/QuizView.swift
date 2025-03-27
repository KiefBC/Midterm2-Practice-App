//
//  QuizView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-26.
//

import SwiftUI

import SwiftUI


struct PickerContentView: View {
    let provinces = [""
                     , "BC", "AB", "SK", "MB"]
    let capitals = ["", "Victoria", "Edmonton", "Regina", "Winnipeg"]
    @State var selectedProvince = ""
    @State var selectedCapital = ""
    var body: some View {
        TabView(selection: $selectedProvince) {
            ForEach(1..<capitals.count) { index in
                PickerView(capitals: capitals, selectedProvince:
                            provinces[index], correctAnswer: capitals[index])
                .tabItem {
                    Label(provinces[index], systemImage: "\(index).circle")
                }
                .tag(provinces[index])
            }
        }
    }
}
