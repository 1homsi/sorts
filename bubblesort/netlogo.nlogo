to-report bubble-sort [arr]
  let n length arr
  let i 0
  repeat n [
    let j 0
    repeat (n - 1 - i) [
      if item j arr > item (j + 1) arr [
        let temp item j arr
        set arr replace-item j arr item (j + 1) arr
        set arr replace-item (j + 1) arr temp
      ]
      set j j + 1
    ]
    set i i + 1
  ]
  report arr
end

show bubble-sort [5 2 8 1 9 3]