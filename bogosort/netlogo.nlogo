to-report bogosort [arr]
  if is-sorted arr [
    report arr
  ]
  report bogosort shuffle-list arr
end

to-report is-sorted [arr]
  let n length arr
  let i 0
  repeat n - 1 [
    if item i arr > item (i + 1) arr [
      report false
    ]
    set i i + 1
  ]
  report true
end

to-report shuffle-list [lst]
  let copy lst
  report copy
end

to test
  let sorted bogosort [3 1 2]
  show sorted
end
