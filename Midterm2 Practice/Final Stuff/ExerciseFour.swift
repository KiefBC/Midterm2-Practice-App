//
//  ExerciseFour.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-04-11.
//

import SwiftUI

struct ExerciseFour: View {
    // The user-facing gauge value, changes in increments of 1
    @State private var gaugeValue = 0
    // The last valid value that was set, used to determine the SF Symbol
    @State private var lastValidValue = 0
    private let validValues = [0, 33, 50, 67, 100]
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Gauge: \(gaugeValue)%")
                .font(.title)
            
            Image(systemName: gaugeSymbol(for: lastValidValue))
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            HStack(spacing: 40) {
                Button {
                    let newValue = gaugeValue - 1
                    let clamped = max(0, min(100, newValue))
                    gaugeValue = clamped
                    // Update lastValidValue only if it is one of the supported gauge values
                    if validValues.contains(clamped) {
                        lastValidValue = clamped
                    }
                } label: {
                    Image(systemName: "arrow.left.circle.fill")
                        .font(.largeTitle)
                }
                
                Button {
                    let newValue = gaugeValue + 1
                    let clamped = max(0, min(100, newValue))
                    gaugeValue = clamped
                    if validValues.contains(clamped) {
                        lastValidValue = clamped
                    }
                } label: {
                    Image(systemName: "arrow.right.circle.fill")
                        .font(.largeTitle)
                }
            }
        }
        .padding()
    }
    
    /// Return the SF Symbol name for the allowed gauge values
    /// Change these symbol names to your actual SF Symbols if available.
    private func gaugeSymbol(for value: Int) -> String {
        switch value {
        case 0:
            return "gauge.with.dots.needle.0percent"
        case 33:
            return "gauge.with.dots.needle.33percent"
        case 50:
            return "gauge.with.dots.needle.50percent"
        case 67:
            return "gauge.with.dots.needle.67percent"
        case 100:
            return "gauge.with.dots.needle.100percent"
        default:
            // Should never be hit, since we only call this for validValues
            return "exclamationmark.triangle"
        }
    }
}

#Preview {
    ExerciseFour()
}
