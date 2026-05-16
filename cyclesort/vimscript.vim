function CycleSort(arr) abort
  let n = len(a:arr)
  let pos = 0
  while pos < n
    let item = a:arr[pos]
    let cycles = 0
    for i in range(n)
      if i != pos && a:arr[i] < item
        let cycles += 1
      endif
    endfor
    if cycles != 0
      while a:arr[pos] == item
        let pos += 1
      endwhile
      let temp = a:arr[pos]
      let a:arr[pos] = item
      let item = temp
      while cycles > 0
        let cycles = 0
        for i in range(n)
          if i != pos && a:arr[i] < item
            let cycles += 1
          endif
        endfor
        while a:arr[pos] == item
          let pos += 1
        endwhile
        let temp = a:arr[pos]
        let a:arr[pos] = item
        let item = temp
        let cycles -= 1
      endwhile
    endif
    let pos += 1
  endwhile
  return a:arr
endfunction

echo CycleSort([5, 2, 8, 1, 9, 3])
