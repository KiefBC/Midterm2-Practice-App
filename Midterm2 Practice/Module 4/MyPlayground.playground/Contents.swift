func checkSquare(total: Int, square: [[Int]]) -> [String: Int] {
    let n = square.count
    var errors = [String: Int]()
    // Array to store each column's sum
    var colSums = Array(repeating: 0, count: n)
    
    // Loop through each row to compute the row sum and update column sums.
    for (i, row) in square.enumerated() {
        let rowSum = row.reduce(0, +)
        if rowSum != total {
            errors["Row \(i)"] = rowSum
        }
        for (j, value) in row.enumerated() {
            colSums[j] += value
        }
    }
    
    // Check each column's sum and record errors if they don't match "total".
    for j in 0..<n {
        if colSums[j] != total {
            errors["Column \(j)"] = colSums[j]
        }
    }
    
    return errors
}

func main() {
    // Example usage:
    let square1 = [
        [8, 1, 6],
        [3, 5, 7],
        [4, 9, 2]
    ]
    print(checkSquare(total: 15, square: square1))  // Expected output: [:]
    
    let square2 = [
        [8, 0, 6],
        [3, 5, 7],
        [5, 9, 2]
    ]
    print(checkSquare(total: 15, square: square2))
    // Expected output: ["Row 0": 14, "Row 2": 16, "Column 0": 16, "Column 1": 14]
}

main()
