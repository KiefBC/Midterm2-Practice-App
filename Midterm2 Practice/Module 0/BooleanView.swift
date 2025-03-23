//
//  BooleanView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-23.
//

import SwiftUI

struct BooleanView: View {
    var body: some View {
        VStack {
            
            OddEvenView()
        }
        .navigationTitle("We Do Booleans!")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    BooleanView()
}
