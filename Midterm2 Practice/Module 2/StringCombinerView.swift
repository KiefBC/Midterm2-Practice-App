//
//  StringCombinerView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-22.
//

/*
 Complete the code only where indicated. This app is a simple string generator. There is:
 
 • a Text Field for holding a string,
 • a Button for prepending a string,
 • a Button for appending a string,
 • a Text for displaying the composite string.
 
 The initial composite string in the Text is "". When pressing the "Insert at start" Button, the
 value inside the Text Field is added to the start of the composite string. When pressing the
 "Append at end" Button, the value inside the Text Field is added to the end of the
 composite string. When the new composite string would exceed 19 characters, nothing is
 inserted or appended.
 */

import SwiftUI

struct StringButtonView: View {
    var label: String
    var action: (String, String) -> String
    @Binding var currentText: String
    var newValue: String
    var body: some View {
        Button(
            label,
            action: {
                if currentText.count + newValue.count < 20 {
                    currentText = action(currentText, newValue)
                }
            }
        )
    }
}
struct StringCombinerView: View {
    @State var textFieldValue = ""
    @State var textValue = ""
    var body: some View {
        VStack {
            TextField("Enter a Value", text: $textFieldValue)
                .multilineTextAlignment(.center)
            HStack {
                StringButtonView(label: "Insert at start", action: {left, right in right + left}, currentText: $textValue, newValue: textFieldValue)
                StringButtonView(label: "Append at end", action: {left, right in left + right}, currentText: $textValue, newValue: textFieldValue)
            }
            Text(textValue)
                .padding()
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
    StringCombinerView()
}
