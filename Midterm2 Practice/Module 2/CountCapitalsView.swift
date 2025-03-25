//
//  CountCapitalsView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-24.
//

import SwiftUI

/*
 Write an app with a Text Field that accepts a string, and a Text that displays how often a
 capitalized letter appears in the sentence. For example, entering "This Sentence Has Six
 Capital Letters" in the Text Field would result in 6 being displayed in the Text. Do not worry
 about integer overflow for this Quiz
 */

struct CountCapitalsView: View {
    @State var userText: String = ""
    @State var capitalCount: Int = 0
    
    var body: some View {
        Text("Enter Text to Count Capitals")
            .multilineTextAlignment(.center)
            .font(.headline)
        
        TextField("Enter Text...", text: Binding(
            get: { userText },
            set: {
                userText = $0
//                capitalCount = userText.reduce(0, {
//                    $0 + ($1.isLetter && $1.isUppercase ? 1 : 0)
//                })
                capitalCount = userText.reduce(0, { (sum, char) in
                    sum + (char.isLetter && char.isUppercase ? 1 : 0)
                })
            }
        ))
        .multilineTextAlignment(.center)
        .padding()
        
        Text("\(capitalCount) \nCapitalized Letters")
            .multilineTextAlignment(.center)
    }
}

#Preview {
    CountCapitalsView()
}
