//
//  Module2View.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-23.
//

import SwiftUI

struct Module2View: View {
    var body: some View {
        ScrollView {
            VStack {
                CalculatorView()
                StringCombinerView()
                ChangeCaseView()
                DigitCounterView()
                CopyMyStringView()
                IsDoublingView()
                PunctuationCounterView()
                CountCapitalsView()
            }
        }
    }
}

#Preview {
    Module2View()
}
