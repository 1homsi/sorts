to shellsort
  let arr [5 2 8 1 9 3]
  let n length arr
  let gap 1
  while [gap <= n] [
    set gap gap * 3 + 1
  ]
  while [gap > 0] [
    set gap floor (gap / 3)
    let i gap
    while [i < n] [
      let temp item i arr
      let j i
      while [and (j >= gap) (item (j - gap) arr > temp)] [
        set arr replace-item j arr item (j - gap) arr
        set j j - gap
      ]
      set arr replace-item j arr temp
      set i i + 1
    ]
  ]
  print arr
end
shellsort
