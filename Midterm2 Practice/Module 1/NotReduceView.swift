//
//  NotReduceView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-22.
//

import SwiftUI

struct NotReduceView: View {
    let numbers: [String?] = ["123", "456.7", "0", "-1", "Testing", nil, "887"]
    let numbersTwo: [String?] =  ["123", "456.7", "0", "-1", "Testing", nil, "2878"]
    let left: String = "ABC"
    let right: String = "+-"
    let numbersThree: [Int] = [0, 2, 4, 6, 4, 7, 7]
    let numbersFour: [Int] = [7, 7, 4, 6, 4, 2, 0]
    
    var body: some View {
        VStack {
            Text("Sum of non-negative numbers: \(sumNonNegatives(from: numbers))")
                .padding(.top)
            Text("Sum of all numbers: \(String(format: "%.01f", sumNumbers(from: numbersTwo)))")
            Text("Sum of all integers: \(sumOfInts(from: numbersTwo))")
            Text("Combined Left and Right: \(combineLeftRight(left: left, right: right))")
            Text("Copy String N Times: \(copyStringNTimes(from: left, n: 3))")
            Text("Remove Out of Order: \(removeOutOfOrder(from: numbersThree))")
            Text("Return Out of Order: \(returnOutOfOrder(from: numbersFour))")
                .padding(.bottom)
        }
        .padding(.horizontal)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
    // Q3 & Q10 (Using reduce)
    private func sumNonNegatives(from: [String?]) -> UInt {
        return from.compactMap( { UInt($0 ?? "0") ?? 0 } ).filter( {$0 >= 0 }).reduce(0, +)
    }
    
    // Q4 & Q11 (Using reduce)
    private func sumNumbers(from: [String?]) -> Double {
        return from.compactMap( { Double($0 ?? "0") ?? 0.0 } ).reduce(0, +)
    }
    
    // Q5 & 12 (Using reduce)
    private func sumOfInts(from: [String?]) -> Int {
        return from.compactMap( { Int($0 ?? "0") ?? 0 } ).reduce(0, +)
    }
    
    // Q6
    private func combineLeftRight(left: String, right: String) -> String {
        var combined: String = ""
        for i in left {
            for j in right {
                combined += String(i) + String(j)
            }
        }
        return combined
    }
    
    // Q7
    private func copyStringNTimes(from: String, n: Int) -> String {
        var combined: String = ""
        for char in from {
            combined += String(repeating: String(char), count: n)
        }
        return combined
    }
    
    // Q8
    private func removeOutOfOrder(from: [Int]) -> [Int] {
        var result: [Int] = []
        if from.count < 2 {
            return result
        }
        for num in from {
            if result.isEmpty || num >= result.last! {
                result.append(num)
            }
        }
        return result
    }
    
    // Q9
    private func returnOutOfOrder(from: [Int]) -> [Int] {
        var result: [Int] = []
        if from.isEmpty {
            return result
        }
        // Set the threshold to the first element
        var threshold: Int = from[0]
        // Skip the first element, aka our threshold
        for i in 1..<from.count {
            let num = from[i] // Current number
            if num >= threshold {
                // If the current number is greater than or equal to the threshold, add it to the result
                result.append(num)
            } else {
                // If the current number is less than the threshold, set the threshold to the current number
                threshold = num
            }
        }
        return result
    }
}

#Preview {
    NotReduceView()
}
