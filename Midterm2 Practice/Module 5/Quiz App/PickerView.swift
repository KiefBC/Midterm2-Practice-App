//
//  PickerView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-26.
//


import SwiftUI

struct PickerView : View {
    var capitals: [String]
    var selectedProvince: String
    var correctAnswer: String
    @State var selectedCapital = ""
    var body: some View {
        VStack {
            Text("The capital of \(selectedProvince) is:")
            Picker("Capitals", selection: $selectedCapital) {
                ForEach(capitals, id: \.self) { capital in
                    Text(capital)
                }
            }
            if selectedCapital == correctAnswer {
                Image(systemName: "checkmark")
                    .foregroundColor(.green)
            }
            else if selectedCapital != "" {
                Image(systemName: "xmark")
                    .foregroundColor(.red)
            }
        }
    }
}
