to-report insertionSort [arr]
  let n length arr
  let i 2
  repeat (n - 1) [
    let key item i arr
    let j (i - 1)
    while [j > 0 and (item j arr) > key] [
      set arr replace-item j arr (item j arr)
      set j (j - 1)
    ]
    set arr replace-item (j + 1) arr key
    set i (i + 1)
  ]
  report arr
end

print insertionSort [5 2 8 1 9 3]