to timsort
  let sorted mergesort [5 2 8 1 9 3] 32
  print sorted
end

to-report mergesort [arr minSize]
  if length arr <= 1 [
    report arr
  ]
  if length arr <= minSize [
    report insertionsort arr
  ]
  
  let mid floor (length arr / 2)
  let left sublist arr 0 mid
  let right sublist arr mid (length arr)
  
  report merge (mergesort left minSize) (mergesort right minSize)
end

to-report insertionsort [arr]
  let result array:copy arr
  let i 1
  repeat (length result - 1) [
    let key item i result
    let j i - 1
    while [j >= 0 and item j result > key] [
      array:set result (j + 1) (item j result)
      set j j - 1
    ]
    array:set result (j + 1) key
    set i i + 1
  ]
  report result
end

to-report merge [left right]
  let result []
  let i 0
  let j 0
  
  while [i < length left and j < length right] [
    if item i left <= item j right [
      set result lput (item i left) result
      set i i + 1
    ] [
      set result lput (item j right) result
      set j j + 1
    ]
  ]
  
  while [i < length left] [
    set result lput (item i left) result
    set i i + 1
  ]
  while [j < length right] [
    set result lput (item j right) result
    set j j + 1
  ]
  
  report result
end
