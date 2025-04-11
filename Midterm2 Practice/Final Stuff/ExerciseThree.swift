//
//  ExerciseThree.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-04-11.
//

import SwiftUI

struct ExerciseThree: View {
    @State private var userText: String = ""
    
    var body: some View {
        VStack {
            TextField("Enter numbers", text: $userText)
                .multilineTextAlignment(.center)
            Text("Enter numbers with spaces in between")
                .font(.caption)
                .padding()
            Text("list of Ints start with a plateau and follows up with a single peak, and then another plateau? \(hasPlateauSinglePeakPlateau(list: userText) ? "Yes" : "No")")
                .multilineTextAlignment(.center)
                .padding()
            Text("Valid Numbers:")
            Text("[1, 1, 1, 3, 5, 6, 7, 4, 3, 3, 1] and [1, 1, 5, 3, 3, 1]")
            Text("Invalid Numbers:")
            Text("[1, 2, 2, 3, 2 ,2, 3, 3] and [1, 5, 1]")
                
                
        }
    }

    func hasPlateauSinglePeakPlateau(list: String) -> Bool {
        
        enum Trend {
            case ascending
            case falling
        }
        
        let numbers = list.split(separator: " ").compactMap { Int($0) }
    
        // We need at least 5 elements to have a chance for:
        // [plateau (≥2), single peak (≥1), plateau (≥2)]
        guard numbers.count >= 5 else { return false }
        
        // 1) Check the FIRST plateau at the start (must be ≥ 2 identical)
        var i = 0
        let firstVal = numbers[0]
        var firstPlateauCount = 1
        
        // Count how many times numbers[0] is repeated
        while i+1 < numbers.count, numbers[i+1] == firstVal {
            i += 1
            firstPlateauCount += 1
        }
        
        // Must have had at least 2 in the first plateau
        if firstPlateauCount < 2 {
            return false
        }
        
        // If we used up the whole numbersay just counting the first plateau, fail
        if i == numbers.count - 1 {
            return false
        }
        
        // 2) Switch to ASCENDING state and look for a strict climb up to a peak
        var trend: Trend = .ascending
        // We'll need at least one “strictly higher” step to confirm ascending
        var hasAscended = false
        
        // Start iterating from the position `i`
        while i+1 < numbers.count {
            let current = numbers[i]
            let next = numbers[i+1]
            
            switch trend {
            case .ascending:
                if next > current {
                    // still ascending
                    hasAscended = true
                    i += 1
                }
                else if next == current {
                    // equal => can't be strictly ascending => no single peak
                    return false
                }
                else {
                    // next < current => we found our PEAK at `current`
                    // But only valid if we have truly ascended at least once
                    if !hasAscended {
                        return false
                    }
                    // Switch to falling
                    trend = .falling
                    i += 1
                }
                
            case .falling:
                // Once falling, we watch for the second plateau of ≥2 identical
                // that occurs in the falling region.
                
                // If next > current => we are going up again => invalid
                if next > current {
                    return false
                }
                
                // If next < current => keep falling
                if next < current {
                    i += 1
                    continue
                }
                
                // If next == current => this might be the second plateau
                // We need to ensure it's ≥ 2 in length
                if next == current {
                    // Start counting how many times `next` is repeated
                    let plateauVal = next
                    var plateauCount = 1
                    
                    // move index forward while we have repeated
                    while i+1 < numbers.count, numbers[i+1] == plateauVal {
                        i += 1
                        plateauCount += 1
                    }
                    
                    // Must have at least 2 for the second plateau
                    if plateauCount < 2 {
                        return false
                    }
                    
                    return true
                }
            }
        }
        
        // If we exit the loop “normally,” we never found a valid second plateau.
        return false
    }
    
    func hasPlateauSinglePeakPlateauReduce(list: String) -> Bool {
        let numbers = list.split(separator: " ").compactMap { Int($0) }
        guard numbers.count >= 5 else { return false }
        
        enum ReduceState {
            /// First, we look for a plateau >= 2 identical at the start.
            case searchingFirstPlateau(previous: Int, count: Int)
            
            /// Then we ascend to find a single peak.
            /// We track if at least one strictly ascending step occurred.
            case ascending(hasAscended: Bool)
            
            /// After the peak, we fall until we detect the second plateau.
            case falling
            
            /// Found second plateau => pattern satisfied
            case done
            
            /// Pattern is invalid
            case failed
        }
        
        struct Accumulator {
            var state: ReduceState
            var lastValue: Int
        }
        
        // Initialize the accumulator to look for the first plateau.
        let initial = Accumulator(
            state: .searchingFirstPlateau(previous: numbers[0], count: 1),
            lastValue: numbers[0]
        )
        
        // We drop the first element because we've already handled it in `initial`.
        let final = numbers.dropFirst().reduce(into: initial) { acc, current in
            // If we've failed or are done, do not modify further.
            switch acc.state {
            case .failed, .done:
                return
                
            case .searchingFirstPlateau(let plateauVal, let count):
                if current == plateauVal {
                    // Still in the first plateau; increment count.
                    acc.state = .searchingFirstPlateau(previous: plateauVal, count: count + 1)
                    acc.lastValue = current
                } else {
                    // We encountered a different value.
                    // Ensure first plateau length >= 2:
                    guard count >= 2 else {
                        acc.state = .failed
                        return
                    }
                    // Now we must ascend (strictly bigger) or fail.
                    guard current > plateauVal else {
                        acc.state = .failed
                        return
                    }
                    // Switch to ascending
                    acc.state = .ascending(hasAscended: true)
                    acc.lastValue = current
                }
                
            case .ascending(let hasAscended):
                let prev = acc.lastValue
                if current > prev {
                    // Still ascending.
                    acc.state = .ascending(hasAscended: true)
                    acc.lastValue = current
                } else if current == prev {
                    // Plateau in ascending => fail (not strictly ascending).
                    acc.state = .failed
                } else {
                    // Found a drop => the single peak was `prev`.
                    if !hasAscended {
                        // Never truly ascended => fail.
                        acc.state = .failed
                    } else {
                        // Switch to falling
                        acc.state = .falling
                    }
                    acc.lastValue = current
                }
                
            case .falling:
                let prev = acc.lastValue
                
                if current > prev {
                    // We’re going back up => invalid pattern.
                    acc.state = .failed
                } else if current < prev {
                    // Continue falling
                    acc.state = .falling
                    acc.lastValue = current
                } else {
                    // current == prev => potential second plateau.
                    // We need at least two in a row => we already have a pair [prev, current].
                    // For simplicity, let's say that’s enough to declare success immediately:
                    acc.state = .done
                    acc.lastValue = current
                }
            }
        }
        
        // After reduce, return true only if final state is .done.
        switch final.state {
        case .done:
            return true
        default:
            return false
        }
    }
}

#Preview {
    ExerciseThree()
}
