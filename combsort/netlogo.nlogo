to comb-sort [arr]
  let gap length arr
  let swapped true
  while [gap > 1 or swapped] [
    set gap floor (gap * 10 / 13)
    if (gap < 1) [set gap 1]
    set swapped false
    let i 0
    repeat (length arr - gap) [
      if (item i arr > item (i + gap) arr) [
        let temp item i arr
        set arr replace-item i arr (item (i + gap) arr)
        set arr replace-item (i + gap) arr temp
        set swapped true
      ]
      set i i + 1
    ]
  ]
  print arr
end

comb-sort [5 2 8 1 9 3]
