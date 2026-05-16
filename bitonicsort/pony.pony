actor Main
    new create(env: Env) =>
        let data: Array[I32] = [3; 7; 4; 8; 6; 2; 1; 5]
        _bitonic_sort(data, 0, data.size().i64(), true)
        for x in data.values() do
            env.out.write(x.string() + " ")
        end
        env.out.print("")

    fun ref _compare_and_swap(arr: Array[I32], i: USize, j: USize, direction: Bool) =>
        try
            let ai = arr(i)?
            let aj = arr(j)?
            if direction == (ai > aj) then
                arr(i)? = aj
                arr(j)? = ai
            end
        end

    fun ref _bitonic_merge(arr: Array[I32], lo: I64, cnt: I64, direction: Bool) =>
        if cnt > 1 then
            let k = cnt / 2
            var i: I64 = lo
            while i < lo + k do
                _compare_and_swap(arr, i.usize(), (i + k).usize(), direction)
                i = i + 1
            end
            _bitonic_merge(arr, lo, k, direction)
            _bitonic_merge(arr, lo + k, k, direction)
        end

    fun ref _bitonic_sort(arr: Array[I32], lo: I64, cnt: I64, direction: Bool) =>
        if cnt > 1 then
            let k = cnt / 2
            _bitonic_sort(arr, lo, k, true)
            _bitonic_sort(arr, lo + k, k, false)
            _bitonic_merge(arr, lo, cnt, direction)
        end
