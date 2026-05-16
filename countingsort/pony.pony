use "collections"

actor Main
  new create(env: Env) =>
    let arr = [as I64: 4; 2; 2; 8; 3; 3; 1]
    let sorted = _sort(arr)
    for v in sorted.values() do
      env.out.write(v.string() + " ")
    end
    env.out.print("")

  fun _sort(arr: Array[I64] val): Array[I64] iso^ =>
    let n = arr.size()
    if n == 0 then return recover Array[I64] end end
    var min: I64 = try arr(0)? else 0 end
    var max: I64 = min
    for v in arr.values() do
      if v < min then min = v end
      if v > max then max = v end
    end
    let range = (max - min + 1).usize()
    let count = Array[I64].init(0, range)
    for v in arr.values() do
      let i = (v - min).usize()
      try count(i)? = (try count(i)? else 0 end) + 1 end
    end
    for i in Range(1, range) do
      try count(i)? = (try count(i)? else 0 end) + (try count(i-1)? else 0 end) end
    end
    let output = recover Array[I64].init(0, n) end
    var i = n
    while i > 0 do
      i = i - 1
      try
        let v = arr(i)?
        let idx = (v - min).usize()
        let pos = ((try count(idx)? else 1 end) - 1).usize()
        try count(idx)? = try count(idx)? else 1 end - 1 end
        try output(pos)? = v end
      end
    end
    output
