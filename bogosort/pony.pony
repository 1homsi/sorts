use "collections"
use "random"
use "time"

actor Main
  new create(env: Env) =>
    let arr: Array[I64] = [3; 1; 4; 1; 5; 9; 2; 6]
    let rng = Rand(Time.now()._1.u64())
    bogosort(arr, rng)
    for v in arr.values() do
      env.out.write(v.string() + " ")
    end
    env.out.print("")

  fun is_sorted(arr: Array[I64] box): Bool =>
    try
      var i: USize = 0
      while i < (arr.size() - 1) do
        if arr(i)? > arr(i + 1)? then return false end
        i = i + 1
      end
    end
    true

  fun ref bogosort(arr: Array[I64], rng: Rand ref) =>
    while not is_sorted(arr) do
      shuffle(arr, rng)
    end

  fun ref shuffle(arr: Array[I64], rng: Rand ref) =>
    let n = arr.size()
    var i = n - 1
    while i > 0 do
      let j = (rng.u64() % (i + 1).u64()).usize()
      try arr.swap_elements(i, j)? end
      i = i - 1
    end
