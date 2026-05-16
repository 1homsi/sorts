to-report quicksort [arr]
  if length arr <= 1 [
    report arr
  ]
  let pivot item 0 arr
  let less []
  let greater []
  let i 1
  repeat (length arr - 1) [
    ifelse item i arr <= pivot [
      set less lput item i arr less
    ] [
      set greater lput item i arr greater
    ]
    set i i + 1
  ]
  report sentence (quicksort less) pivot (quicksort greater)
end

show quicksort [5 2 8 1 9 3]