actor Main
  new create(env: Env) =>
    let arr: Array[I64] ref = [5; 4; 3; 2; 1]
    cycle_sort(arr)
    for v in arr.values() do
      env.out.write(v.string() + " ")
    end
    env.out.print("")

  fun ref cycle_sort(arr: Array[I64] ref) =>
    let n = arr.size()
    var writes: USize = 0
    var cycle_start: USize = 0
    while cycle_start < (n - 1) do
      try
        var item = arr(cycle_start)?
        var pos = cycle_start
        var i = cycle_start + 1
        while i < n do
          if arr(i)? < item then pos = pos + 1 end
          i = i + 1
        end
        if pos != cycle_start then
          while item == arr(pos)? do pos = pos + 1 end
          let tmp = arr(pos)?
          arr(pos)? = item
          item = tmp
          writes = writes + 1
          while pos != cycle_start do
            pos = cycle_start
            i = cycle_start + 1
            while i < n do
              if arr(i)? < item then pos = pos + 1 end
              i = i + 1
            end
            while item == arr(pos)? do pos = pos + 1 end
            let t = arr(pos)?
            arr(pos)? = item
            item = t
            writes = writes + 1
          end
        end
      end
      cycle_start = cycle_start + 1
    end
