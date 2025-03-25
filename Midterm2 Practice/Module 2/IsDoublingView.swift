//
//  IsDoublingView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-24.
//

import SwiftUI

struct ToggleView: View {
    @Binding var isDoubling: Bool
    
    var body: some View {
        Toggle("Double?", isOn: $isDoubling)
            .padding()
    }
}
struct DoublingButtonView: View {
    var isDoubling: Bool
    @Binding var count: Int
    
    var body: some View {
        Button("Double?") {
            self.count += isDoubling ? 20 : 10
        }
    }
}

struct TextView: View {
    var count: Int
    
    var body: some View {
        Text("Count: \(count)")
            .padding()
            .font(.headline)
            .multilineTextAlignment(.center)
    }
}
struct IsDoublingView: View {
    @State var isDoubling = false
    @State var count = 0
    
    var body: some View {
        VStack {
            ToggleView(isDoubling: $isDoubling)
            DoublingButtonView(isDoubling: isDoubling, count: $count)
            TextView(count: count)
        }
    }
}

#Preview {
    IsDoublingView()
}
