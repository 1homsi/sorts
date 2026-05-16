to bitonicsort [arr lo cnt dir]
  if cnt > 1 [
    let k cnt / 2
    bitonicsort arr lo k 1
    bitonicsort arr (lo + k) k 0
    bitonicmerge arr lo cnt dir
  ]
end

to bitonicmerge [arr lo cnt dir]
  if cnt > 1 [
    let k cnt / 2
    let i lo
    repeat (cnt - k) [
      if ((item i arr) > (item (i + k) arr)) = (dir = 1) [
        let tmp item i arr
        set-item i arr (item (i + k) arr)
        set-item (i + k) arr tmp
      ]
      set i i + 1
    ]
    bitonicmerge arr lo k dir
    bitonicmerge arr (lo + k) k dir
  ]
end

to test
  let arr [5 2 8 1 9 3 7 4]
  bitonicsort arr 0 8 1
  print arr
end

test
