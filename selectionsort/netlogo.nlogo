to selection-sort
  let arr [5 2 8 1 9 3]
  let n length arr
  let i 0
  repeat n - 1 [
    let min-idx i
    let j i + 1
    repeat n - i - 1 [
      if item j arr < item min-idx arr [
        set min-idx j
      ]
      set j j + 1
    ]
    let tmp item i arr
    set arr replace-item i arr item min-idx arr
    set arr replace-item min-idx arr tmp
    set i i + 1
  ]
  print arr
end

selection-sort