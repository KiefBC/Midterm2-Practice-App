//
//  PunctuationCounterView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-24.
//

import SwiftUI

/*
 Write an app with a Text Field that accepts a string, and a Text that displays how often
 punctuation --- .,:;!? --- appears in the Text Field. For example, entering "This sentence, I
 insist, contains too much punctuation!!" in the Text Field would result in 4 being displayed
 in the Text. Do not worry about integer overflow for this Quiz
 */

struct PunctuationCounterView: View {
    @State var userText: String = ""
    @State var punctuationCount: Int = 0
    let punctuationMarks = [".", ",", ":", ";", "!", "?"]
    
    var body: some View {
        Text("Enter Text to Count Punctuation")
            .multilineTextAlignment(.center)
            .font(.headline)
        
        TextField("Enter Text...", text: Binding(
            get: { userText },
            set: {
                userText = $0
                punctuationCount = userText.reduce(0, { $0 + (punctuationMarks.contains(String($1)) ? 1 : 0) })
            }
        ))
        .multilineTextAlignment(.center)
        .padding()
        Text("\(punctuationCount) \nOccurrences of Punctuation")
            .multilineTextAlignment(.center)
    }
}

#Preview {
    PunctuationCounterView()
}
