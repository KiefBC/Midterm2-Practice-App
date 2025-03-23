//
//  DigitCounterView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-22.
//

/*
 Create a user interface that consists of the following elements:
 
 (a) an empty Text Field using variable "userText"
 (b) below that, a Text Label using variable "digitLabel"
 
 Whenever text is entered, the Text Label must list the number of digits in the Text Field. For
 example, if the Text Field contains "123 Main Street", the Text Label must read "3 digits"
 */

import SwiftUI

struct DigitCounterView: View {
    @State private var userText: String = ""
    @State private var digitLabel: String = ""
    @State private var oddNums: String = ""
    
    
    var body: some View {
        VStack {
            TextField("Enter Text...", text: Binding(
                get: {
                    userText
                },
                set: {
                    userText = $0
                    let count = userText.reduce(0, { $1.isNumber ? $0 + 1 : $0 })
                    let oddNumAmount = userText.reduce(0) { count, char in
                        if char.isNumber, let digit = Int(String(char)), digit % 2 == 1 {
                            return count + 1
                        }
                        return count
                    }
                    digitLabel = String(count) + " digits"
                    oddNums = String(oddNumAmount) + " odd numbers"
                }
            ))
                .multilineTextAlignment(.center)
            Text(digitLabel)
            Text(oddNums)
                
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding(.horizontal, 16)
    }
    
    private func countDigits(from: String) -> String {
        return String(from.filter( { $0.isNumber } ).count) + " digits"
    }
}

#Preview {
    DigitCounterView()
}
