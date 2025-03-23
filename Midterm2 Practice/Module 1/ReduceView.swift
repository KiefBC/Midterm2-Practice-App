//
//  ReduceView.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-03-22.
//

import SwiftUI

struct ReduceView: View {
    let numbers: [String?] = ["123", "456.7", "0", "-1", "Testing", nil, "887"]
    let numbersTwo: [String?] =  ["123", "456.7", "0", "-1", "Testing", nil, "2878"]
    let numbersThree: [Int] = [0, 2, 4, 6, 4, 7, 7]
    let numbersFour: [Int] = [7, 7, 4, 6, 4, 2, 0]
    let stringList: [String] = ["", "ab", "cdef"]
    
    var body: some View {
        VStack {
            Text("Sum of non-negative numbers: \(sumNonNegatives(from: numbers))")
                .padding(.top)
            Text("Sum of all numbers: \(String(format: "%.01f", sumNumbers(from: numbersTwo)))")
            Text("Sum of all integers: \(sumOfInts(from: numbersTwo))")
            Text("Remove Out of Order: \(removeOutOfOrder(from: numbersThree))")
            Text("Return Out of Order: \(returnOutOfOrder(from: numbersFour))")
            Text("Filtered List: \(filterList(from: stringList, filter: { String($0.count) }))")
                .padding(.bottom)
        }
        .padding(.horizontal)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(Color.gray, lineWidth: 1)
        )
    }
    // 10
    private func sumNonNegatives(from: [String?]) -> UInt {
        return from.reduce(0, { (result, element) -> UInt in result + (UInt(element ?? "0") ?? 0 ) } )
    }
    
    // Q11
    private func sumNumbers(from: [String?]) -> Double {
        return from.reduce(0, { (result, element) -> Double in result + (Double(element ?? "0") ?? 0.0 ) } )
    }
    
    // Q12
    private func sumOfInts(from: [String?]) -> Int {
        return from.reduce(0, { (result, element) -> Int in result + (Int(element ?? "0") ?? 0 ) } )
    }
    
    // Q13
    private func removeOutOfOrder(from: [Int]) -> [Int] {
        if from.count < 2 {
            return from
        }
        
        return from.reduce(into: [Int](), { (result, element) in
            if result.isEmpty || element >= result.last! {
                result.append(element)
            }
        })
    }
    
    // Q14
    private func returnOutOfOrder(from: [Int]) -> [Int] {
        if from.isEmpty {
            return from
        }
        
        // Store both the result array and the current threshold in a tuple
        return Array(from.dropFirst().reduce(into: (result: [Int](), threshold: from[0])) { (state, element) in
            if element >= state.threshold {
                // Element is out of order (not strictly descending), add it to result
                state.result.append(element)
            } else {
                // Element is in proper descending order, update threshold
                state.threshold = element
            }
        }.result)
    }
    
    // Q15
    func filterList(from: [String], filter: (String) -> String) -> [String] {
        return from.map { filter($0) }
    }
}

#Preview {
    ReduceView()
}
