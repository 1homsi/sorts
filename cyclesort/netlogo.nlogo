to cyclesort [arr]
  let n length arr
  let pos 0
  while [pos < n] [
    let item item pos arr
    let cycles 0
    let i 0
    repeat n [
      if (i != pos and (item i arr) < item) [
        set cycles cycles + 1
      ]
      set i i + 1
    ]
    if (cycles != 0) [
      while [(item pos arr) = item] [
        set pos pos + 1
      ]
      let temp item pos arr
      set arr replace-item pos arr item
      set item temp
      while [cycles > 0] [
        set cycles 0
        let i 0
        repeat n [
          if (i != pos and (item i arr) < item) [
            set cycles cycles + 1
          ]
          set i i + 1
        ]
        while [(item pos arr) = item] [
          set pos pos + 1
        ]
        set temp item pos arr
        set arr replace-item pos arr item
        set item temp
        set cycles cycles - 1
      ]
    ]
    set pos pos + 1
  ]
  report arr
end

to setup
  let result cyclesort [5 2 8 1 9 3]
  print result
end
