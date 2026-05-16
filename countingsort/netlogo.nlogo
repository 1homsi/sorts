to-report countingsort [arr]
  if length arr = 0 [report arr]

  let max 0
  let i 0
  repeat length arr [
    if item i arr > max [set max item i arr]
    set i i + 1
  ]

  let count n-values (max + 1) [0]
  set i 0
  repeat length arr [
    let idx item i arr
    let val item idx count
    set count replace-item idx count (val + 1)
    set i i + 1
  ]

  let output []
  let i 0
  repeat (max + 1) [
    let cnt item i count
    let j 0
    repeat cnt [
      set output lput i output
      set j j + 1
    ]
    set i i + 1
  ]

  report output
end

print countingsort [5 2 8 1 9 3]
