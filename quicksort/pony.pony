actor Main
    new create(env: Env) =>
        let arr: Array[I64] = [3; 6; 8; 10; 1; 2; 1]
        _quicksort(arr, 0, arr.size().i64() - 1)
        for x in arr.values() do
            env.out.print(x.string())
        end

    fun ref _partition(arr: Array[I64], low: I64, high: I64): I64 =>
        try
            let pivot = arr(high.usize())?
            var i: I64 = low
            var j: I64 = low
            while j < high do
                let v = arr(j.usize())?
                if v <= pivot then
                    let tmp = arr(i.usize())?
                    arr(i.usize())? = v
                    arr(j.usize())? = tmp
                    i = i + 1
                end
                j = j + 1
            end
            let tmp = arr(i.usize())?
            arr(i.usize())? = arr(high.usize())?
            arr(high.usize())? = tmp
            i
        else
            low
        end

    fun ref _quicksort(arr: Array[I64], low: I64, high: I64) =>
        if low < high then
            let p = _partition(arr, low, high)
            _quicksort(arr, low, p - 1)
            _quicksort(arr, p + 1, high)
        end
