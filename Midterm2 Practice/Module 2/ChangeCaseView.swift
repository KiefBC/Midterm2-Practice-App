//
//  ChangeCaseView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-22.
//

/*
 Complete the code only where indicated. This app is a simple string generator. There is:
 
 • a Text Field for holding a character,
 • a Button for appending the character as uppercase,
 • a Button for appending the character as lowercase,
 • a Text for displaying the composite string.
 
 The initial composite string in the Text is "". When pressing the "+" Button, the uppercase
 version of the value inside the Text Field is added to the end of the composite string. When
 pressing the "-" Button, the lowercase version of the value inside the Text Field is added to
 the end of the composite string. If the value inside the Text Field is not equal to 1
 character, or is not a letter, the composite string is not modified. Do not worry about
 overflow
 */

import SwiftUI

struct CaseButtonView: View {
    var label: String
    var action: (String, String) -> String
    @Binding var currentText: String
    var newValue: String
    var body: some View {
        Button(
            label,
            action: {
                if newValue.count == 1 && newValue.rangeOfCharacter(from: .letters) != nil {
                    currentText = action(currentText, newValue)
                }
            }
        )
    }
}

struct ChangeCaseView: View {
    @State var textFieldValue = ""
    @State var textValue = ""
    var body: some View {
        VStack {
            TextField("Enter a Value", text: $textFieldValue)
                .multilineTextAlignment(.center)
            HStack {
                CaseButtonView(label: "+", action: {left, right in String(left) + String(right).uppercased()}, currentText: $textValue, newValue: textFieldValue)
                CaseButtonView(label: "-", action: {left, right in String(left) + String(right).lowercased()}, currentText: $textValue, newValue: textFieldValue)
            }
            Text(textValue)
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
    ChangeCaseView()
}
