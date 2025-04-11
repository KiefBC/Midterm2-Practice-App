//
//  ExerciseOne.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-04-11.
//

import SwiftUI

struct ExerciseOne: View {
    @State var userInput: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter a number(s)", text: $userInput)
                .multilineTextAlignment(.center)
            Text("Enter with a space between each number")
                .padding()
                .font(.caption)
            Text("Are all numbers equal? \(usingReduce(userInput: userInput) ? "Yes" : "No")")
                .padding()
        }
    }
    
    func usingForLoop(userInput: String) -> Bool {
        let numbers: [Int] = userInput.split(separator: " ").compactMap( { Int($0) })
        if numbers.isEmpty || numbers.count == 1 {
            return false
        }
        
        let firstElement: Int = numbers[0]
        for num in numbers.dropFirst(0) {
            if num != firstElement {
                return false
            }
        }
        
        return true
    }
    
    func usingReduce(userInput: String) -> Bool {
        let numbers: [Int] = userInput.split(separator: " ").compactMap( { Int($0) })
        
        if numbers.isEmpty || numbers.count == 1 {
            return false
        }
        
        let firstElement: Int = numbers[0]
        return numbers.dropFirst(0).reduce(true) { (result, num) in
            result && (num == firstElement)
        }
    }
}

#Preview {
    ExerciseOne()
}
