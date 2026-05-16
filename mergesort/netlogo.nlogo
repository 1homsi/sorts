to merge [arr left mid right]
  let i left
  let j (mid + 1)
  let result []
  
  while [i <= mid and j <= right] [
    ifelse (item i arr) <= (item j arr) [
      set result lput (item i arr) result
      set i (i + 1)
    ] [
      set result lput (item j arr) result
      set j (j + 1)
    ]
  ]
  
  repeat (mid - i + 1) [
    set result lput (item i arr) result
    set i (i + 1)
  ]
  
  repeat (right - j + 1) [
    set result lput (item j arr) result
    set j (j + 1)
  ]
  
  let k 0
  repeat length result [
    set arr replace-item (left + k) arr (item k result)
    set k (k + 1)
  ]
end

to mergesort [arr left right]
  if left < right [
    let mid truncate (left + right) / 2
    mergesort arr left mid
    mergesort arr (mid + 1) right
    merge arr left mid right
  ]
end

let arr [5 2 8 1 9 3]
mergesort arr 0 5
print arr
