//
//  CalculatorView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-22.
//

/*
 Complete the code only where indicated. This app is a very simple calculator. There is:
 
• a Text Field for holding a value,
• a Button for adding,
• a Button for subtracting, and
• a Text for displaying the subtotal.
 
The initial value in the Text is 0. When pressing the + Button, the value inside the Text Field
is added to the value. When pressing the - Button, the value inside the Text Field is
subtracted from the value. When the Text Field contains an invalid Int, nothing is added or
subtracted. Do not worry about overflow.
*/

import SwiftUI

struct ButtonView: View {
    var label: String
    var action: (Int, Int) -> Int
    @Binding var runningTotal: Int
    var newValue: String
    var body: some View {
        Button(
            label,
            action: {
                if let sum = Int(self.newValue) {
                    self.runningTotal = action(runningTotal, sum)
                }
            }
        )
    }
}

struct CalculatorView: View {
    @State var textFieldValue = ""
    @State var textValue = 0
    var body: some View {
        VStack {
            TextField("Enter a Value", text: $textFieldValue)
                .multilineTextAlignment(.center)
            HStack {
                ButtonView(label: "+", action: +, runningTotal: $textValue, newValue: textFieldValue)
                ButtonView(label: "-", action: -, runningTotal: $textValue, newValue: textFieldValue)
            }
            Text(String(textValue))
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
        .padding(.horizontal, 16)
    }
}

#Preview {
    CalculatorView()
}
