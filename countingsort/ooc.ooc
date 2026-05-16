countingsort: func (arr: List<Int>) -> List<Int> {
  if (arr isEmpty()) return ArrayList<Int> new()

  max := 0
  for (val in arr) {
    if (val > max) max = val
  }

  count := ArrayList<Int> new(max + 1)
  for (i in 0..max) count add(0)

  for (val in arr) {
    count[val] = count[val] + 1
  }

  output := ArrayList<Int> new()
  for (i in 0..max) {
    for (j in 0..<count[i]) {
      output add(i)
    }
  }

  return output
}

"Counting sort:" println()
countingsort([5, 2, 8, 1, 9, 3]) toString() println()
