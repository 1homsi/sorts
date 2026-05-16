to cocktailsort [arr]
  let n length arr
  let i 0
  while [i < n] [
    let swapped false
    let k 0
    repeat (n - i - 1) [
      if (item k arr) > (item (k + 1) arr) [
        let temp item k arr
        set arr replace-item k arr (item (k + 1) arr)
        set arr replace-item (k + 1) arr temp
        set swapped true
      ]
      set k k + 1
    ]
    if not swapped [stop]
    set i i + 1
  ]
  report arr
end

print cocktailsort [5 2 8 1 9 3]
