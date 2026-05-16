use "collections"

actor Main
  new create(env: Env) =>
    let arr: Array[I64] = [64; 34; 25; 12; 22; 11; 90]
    bubble_sort(arr)
    for x in arr.values() do
      env.out.write(x.string() + " ")
    end
    env.out.print("")

  fun ref bubble_sort(arr: Array[I64]) =>
    var n = arr.size()
    var swapped = true
    while swapped do
      swapped = false
      var i: USize = 0
      while i < (n - 1) do
        try
          if arr(i)? > arr(i + 1)? then
            arr(i)? = arr(i + 1)? = arr(i)?
            swapped = true
          end
        end
        i = i + 1
      end
      n = n - 1
    end
