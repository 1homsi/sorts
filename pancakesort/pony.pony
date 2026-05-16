actor Main
    new create(env: Env) =>
        let arr: Array[I32] = [3; 6; 2; 7; 4; 1; 5]
        _pancake_sort(arr)
        for v in arr.values() do
            env.out.write(v.string() + " ")
        end
        env.out.print("")

    fun ref _flip(arr: Array[I32], k: USize) =>
        var left: USize = 0
        var right: USize = k
        while left < right do
            try
                let tmp = arr(left)?
                arr(left)? = arr(right)?
                arr(right)? = tmp
            end
            left = left + 1
            right = right - 1
        end

    fun ref _find_max_idx(arr: Array[I32], size: USize): USize =>
        var max_idx: USize = 0
        var i: USize = 1
        while i < size do
            try
                if arr(i)? > arr(max_idx)? then
                    max_idx = i
                end
            end
            i = i + 1
        end
        max_idx

    fun ref _pancake_sort(arr: Array[I32]) =>
        var size = arr.size()
        while size > 1 do
            let max_idx = _find_max_idx(arr, size)
            if max_idx != (size - 1) then
                if max_idx != 0 then _flip(arr, max_idx) end
                _flip(arr, size - 1)
            end
            size = size - 1
        end
