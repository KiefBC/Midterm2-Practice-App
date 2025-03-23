//
//  Module1View.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-23.
//

import SwiftUI

struct Module1View: View {
    var body: some View {
        VStack {
            NotReduceView()
            ReduceView()
        }
        .navigationTitle("Module 1")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    Module1View()
}
