to gnomesort
  local [i temp arr]
  set arr [5 2 8 1 9 3]
  set i 0
  while [i < length arr] [
    if i = 0 [
      set i (i + 1)
    ] [
      if (item (i + 1) arr < item i arr) [
        set temp (item (i + 1) arr)
        set arr (replace-item (i + 1) arr (item i arr))
        set arr (replace-item i arr temp)
        set i (i - 1)
      ] [
        set i (i + 1)
      ]
    ]
  ]
  print arr
end

to go
  gnomesort
end
