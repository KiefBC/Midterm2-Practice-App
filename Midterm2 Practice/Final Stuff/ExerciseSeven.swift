//
//  ExerciseSeven.swift
//  Midterm2 Practice
//
//  Created by Kiefer Hay on 2025-04-13.
//

import SwiftUI
import Observation

/// Represents the possible states of a cell on the game board
enum CellType {
    /// An empty cell that can be filled
    case empty
    /// A cell containing a sun icon
    case sun
    /// A cell containing a moon icon
    case moon
}

/// Represents whose turn it currently is
enum CurrentTurn {
    /// Sun player's turn
    case sun
    /// Moon player's turn
    case moon
}

/// The main game model that manages the state and logic of the Sun-Moon game
@Observable
class GameBoard {
    /// The 7x7 game board represented as a 2D array of CellTypes
    var board: [[CellType]]
    
    /// Tracks whose turn it currently is
    var currentTurn: CurrentTurn
    
    /// Counter for the number of sun pieces on the board
    var sunCount: Int = 0
    
    /// Counter for the number of moon pieces on the board
    var moonCount: Int = 0
    
    /// Initializes a new game board with empty cells and moon as the starting player
    init() {
        board = Array(repeating: Array(repeating: .empty, count: 7), count: 7)
        currentTurn = .moon  // Starting with moon as per example
        updateCounts()
    }
    
    /// Updates the counters for sun and moon pieces on the board
    func updateCounts() {
        sunCount = board.flatMap { $0 }.filter { $0 == .sun }.count
        moonCount = board.flatMap { $0 }.filter { $0 == .moon }.count
    }
    
    /// Handles a tap on a cell at the specified position
    /// - Parameters:
    ///   - row: The row index of the tapped cell
    ///   - column: The column index of the tapped cell
    func tap(row: Int, column: Int) {
        guard board[row][column] == .empty else { return }
        
        // Place the new piece
        board[row][column] = currentTurn == .sun ? .sun : .moon
        
        // Check and convert pieces in the same row
        checkAndConvertLine(row: row, column: column)
        
        // Check and convert pieces in the same column
        checkAndConvertColumn(row: row, column: column)
        
        updateCounts()
        
        // Switch turns
        currentTurn = currentTurn == .sun ? .moon : .sun
    }
    
    /// Checks and converts pieces in the same row as the placed piece
    /// - Parameters:
    ///   - row: The row index of the placed piece
    ///   - column: The column index of the placed piece
    private func checkAndConvertLine(row: Int, column: Int) {
        let currentType = board[row][column]
        
        // Check right
        var rightIdx = column + 1
        var hasOpposite = false
        while rightIdx < 7 {
            if board[row][rightIdx] == currentType {
                if hasOpposite {
                    // Convert all pieces in between
                    for i in (column + 1)..<rightIdx {
                        board[row][i] = currentType
                    }
                }
                break
            } else if board[row][rightIdx] == .empty {
                break
            } else {
                hasOpposite = true
            }
            rightIdx += 1
        }
        
        // Check left
        var leftIdx = column - 1
        hasOpposite = false
        while leftIdx >= 0 {
            if board[row][leftIdx] == currentType {
                if hasOpposite {
                    // Convert all pieces in between
                    for i in (leftIdx + 1)..<column {
                        board[row][i] = currentType
                    }
                }
                break
            } else if board[row][leftIdx] == .empty {
                break
            } else {
                hasOpposite = true
            }
            leftIdx -= 1
        }
    }
    
    /// Checks and converts pieces in the same column as the placed piece
    /// - Parameters:
    ///   - row: The row index of the placed piece
    ///   - column: The column index of the placed piece
    private func checkAndConvertColumn(row: Int, column: Int) {
        let currentType = board[row][column]
        
        // Check down
        var downIdx = row + 1
        var hasOpposite = false
        while downIdx < 7 {
            if board[downIdx][column] == currentType {
                if hasOpposite {
                    // Convert all pieces in between
                    for i in (row + 1)..<downIdx {
                        board[i][column] = currentType
                    }
                }
                break
            } else if board[downIdx][column] == .empty {
                break
            } else {
                hasOpposite = true
            }
            downIdx += 1
        }
        
        // Check up
        var upIdx = row - 1
        hasOpposite = false
        while upIdx >= 0 {
            if board[upIdx][column] == currentType {
                if hasOpposite {
                    // Convert all pieces in between
                    for i in (upIdx + 1)..<row {
                        board[i][column] = currentType
                    }
                }
                break
            } else if board[upIdx][column] == .empty {
                break
            } else {
                hasOpposite = true
            }
            upIdx -= 1
        }
    }
    
    /// Checks if the game is over (no empty cells remaining)
    /// - Returns: true if the game is over, false otherwise
    func isGameOver() -> Bool {
        return !board.flatMap { $0 }.contains(.empty)
    }
}

/// The main view of the Sun-Moon game
struct ExerciseSeven: View {
    /// The game board model
    @State private var gameBoard = GameBoard()
    
    var body: some View {
        VStack(spacing: 20) {
            // Current turn indicator
            HStack(spacing: 40) {
                Image(systemName: "moon.circle.fill")
                    .font(.system(size: 30))
                    .foregroundColor(
                        gameBoard.currentTurn == .moon ? .blue : .gray
                    )
                
                Image(systemName: "sun.max.circle")
                    .font(.system(size: 30))
                    .foregroundColor(
                        gameBoard.currentTurn == .sun ? .yellow : .gray
                    )
            }
            
            // Game board
            VStack(spacing: 2) {
                ForEach(0..<7) { row in
                    HStack(spacing: 2) {
                        ForEach(0..<7) { column in
                            CellView(type: gameBoard.board[row][column])
                                .frame(width: 40, height: 40)
                                .background(Color.gray.opacity(0.2))
                                .onTapGesture {
                                    gameBoard.tap(row: row, column: column)
                                }
                        }
                    }
                }
            }
            
            // Counters
            HStack(spacing: 40) {
                HStack {
                    Image(systemName: "moon.circle.fill")
                    Text("\(gameBoard.moonCount)")
                }
                
                HStack {
                    Image(systemName: "sun.max.circle")
                    Text("\(gameBoard.sunCount)")
                }
            }
            
            if gameBoard.isGameOver() {
                Text("Game Over!")
                    .font(.title)
                    .foregroundColor(.blue)
            }
        }
        .padding()
    }
}

/// A view representing a single cell on the game board
struct CellView: View {
    /// The type of the cell (empty, sun, or moon)
    let type: CellType
    
    var body: some View {
        switch type {
        case .empty:
            RoundedRectangle(cornerRadius: 4)
                .strokeBorder(Color.gray, lineWidth: 1)
        case .sun:
            Image(systemName: "sun.max.circle")
                .foregroundColor(.yellow)
        case .moon:
            Image(systemName: "moon.circle.fill")
                .foregroundColor(.blue)
        }
    }
}

/// Preview provider for the ContentView
#Preview {
    ExerciseSeven()
}
