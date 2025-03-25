//
//  CopyMyStringView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-24.
//

import SwiftUI

struct CopyToggleView: View {
    @Binding var isCopying: Bool
    
    var body: some View {
        Toggle("Copy String?", isOn: $isCopying)
            .padding()
            .multilineTextAlignment(.center)
    }
}
struct TextFieldView: View {
    @State var textField: String = ""
    var isCopying: Bool
    @Binding var text: String
    @State var copiedString: String = ""
    
    var body: some View {
        TextField("Enter a string...", text: Binding(
            get: { textField },
            set: {
                textField = $0
                copiedString = text
                text = isCopying ? textField : copiedString
            }
        ))
        .multilineTextAlignment(.center)
    }
}
struct CopyTextView: View {
    var text: String
    
    var body: some View {
        Text(text)
            .padding()
            .font(.headline)
            .multilineTextAlignment(.center)
    }
}
struct CopyMyStringView: View {
    @State var isCopying = false
    @State var text = ""
    var body: some View {
        VStack {
            CopyToggleView(isCopying: $isCopying)
            TextFieldView(isCopying: isCopying, text: $text)
            CopyTextView(text: text)
        }
    }
}

#Preview {
    CopyMyStringView()
}
