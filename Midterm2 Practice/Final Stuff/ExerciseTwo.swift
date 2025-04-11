//
//  ExerciseTwo.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-04-11.
//

import SwiftUI

struct ExerciseTwo: View {
    @State private var userText: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter numbers", text: $userText)
                .multilineTextAlignment(.center)
            Text("Enter numbers with spaces in between")
                .font(.caption)
                .padding()
            Text("Only a Singular Peak? \(hasSinglePeakReduce(list: userText) ? "Yes" : "No")")
                .multilineTextAlignment(.center)
                .padding()
            Text("Valid Numbers:")
            Text("[1, 2, 3, 4, 1] and [4, 1, 1]")
            Text("Invalid Numbers:")
            Text("[1, 2, 3, 4, 1, 2] and [1, 1, 1]")
        }
    }
    
    func hasSinglePeak(list: String) -> Bool {
        let numbers = list.split(separator: " ").compactMap({ Int($0) })
        var peakCount: Int = 0
        
        guard numbers.count >= 3 else {
            return false
        }
        
        if numbers[0] > numbers[1] {
            peakCount += 1
        }
        
        for num in 1..<numbers.count - 1 {
            if numbers[num] > numbers[num - 1] && numbers[num] > numbers[num + 1] {
                peakCount += 1
            }
        }
        
        return peakCount == 1
    }
    
    func hasSinglePeakReduce(list: String) -> Bool {
        let numbers = list.split(separator: " ").compactMap { Int($0) }

        guard numbers.count >= 3 else {
            return false
        }

        let peakCount = numbers.enumerated().reduce(into: 0) { count, current in
            let (index, value) = current

            guard index > 0 && index < numbers.count - 1 else { return }

            let prev = numbers[index - 1]
            let next = numbers[index + 1]

            if value > prev && value > next {
                count += 1
            }
        }

        return peakCount == 1
    }
}

#Preview {
    ExerciseTwo()
}
