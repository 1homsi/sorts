func countingSort(_ arr: [Int]) -> [Int] {
    guard !arr.isEmpty else { return arr }
    let max = arr.max()!
    let min = arr.min()!
    let range = max - min + 1
    var count = [Int](repeating: 0, count: range)
    for v in arr { count[v - min] += 1 }
    for i in 1..<range { count[i] += count[i - 1] }
    var output = [Int](repeating: 0, count: arr.count)
    for v in arr.reversed() {
        count[v - min] -= 1
        output[count[v - min]] = v
    }
    return output
}

print(countingSort([4, 2, 2, 8, 3, 3, 1]))
