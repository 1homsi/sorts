to stoogesort [a i j]
  if item j a < item i a [
    let temp item j a
    set a replace-item j a (item i a)
    set a replace-item i a temp
  ]
  if j - i > 1 [
    let t floor ((j - i + 1) / 3)
    stoogesort a i (j - t)
    stoogesort a (i + t) j
    stoogesort a i (j - t)
  ]
end

to main
  let arr [5 2 8 1 9 3]
  stoogesort arr 0 5
  print arr
end

main
