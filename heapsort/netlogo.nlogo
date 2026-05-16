to heapsort [arr]
  let n length arr
  let i int (n / 2) - 1
  repeat n [
    siftdown arr i n
    set i i - 1
  ]
  set i n - 1
  repeat n [
    let temp item 0 arr
    set arr replace-item 0 arr (item i arr)
    set arr replace-item i arr temp
    siftdown arr 0 i
    set i i - 1
  ]
  print arr
end

to siftdown [arr idx n]
  let largest idx
  let left 2 * idx + 1
  let right 2 * idx + 2
  if (left < n) and (item left arr > item largest arr) [
    set largest left
  ]
  if (right < n) and (item right arr > item largest arr) [
    set largest right
  ]
  if (largest != idx) [
    let temp item idx arr
    set arr replace-item idx arr (item largest arr)
    set arr replace-item largest arr temp
    siftdown arr largest n
  ]
end

heapsort [5 2 8 1 9 3]
