to-report radixsort [arr]
  let max max arr
  let exp 1
  while [max / exp > 0] [
    set arr counting-sort-by-exp arr exp
    set exp exp * 10
  ]
  report arr
end

to-report counting-sort-by-exp [arr exp]
  report arr
end

print radixsort [5 2 8 1 9 3]
