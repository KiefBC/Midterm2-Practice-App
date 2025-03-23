//
//  OddEvenView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-22.
//

import SwiftUI

struct OddEvenView: View {
    @State private var userInput: String = ""
    
    var body: some View {
        VStack { // isEven
            TextField("Enter Text Here", text: $userInput)
                .padding(.top)
                .textFieldStyle(.roundedBorder)
                .font(.headline)
                .foregroundColor(.blue)
                .multilineTextAlignment(.center)
            
            
            Text("Is it Even?: \(isEven(from: userInput) ? "Yes" : "No")")
                .padding(.bottom)
        }
        .textFieldStyle(.roundedBorder)
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding(.horizontal, 16)
    }
    
    // Q1
    private func isEven(from: String) -> Bool {
        return (Int(from) ?? 1) % 2 == 0
    }
    
    // Q2
    private func isOdd(from: String) -> Bool {
        return (Int(from) ?? 2) % 2 == 1
    }
}

#Preview {
    OddEvenView()
}
