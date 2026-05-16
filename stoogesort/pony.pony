use "collections"

actor Main
    new create(env: Env) =>
        let arr = Array[I32].>push(3).>push(1).>push(4).>push(1).>push(5).>push(9).>push(2).>push(6)
        stooge_sort(arr, 0, arr.size() - 1)
        for x in arr.values() do
            env.out.write(x.string() + " ")
        end
        env.out.write("\n")

    fun ref stooge_sort(arr: Array[I32], first: USize, last: USize) =>
        try
            if arr(first)? > arr(last)? then
                arr.swap_elements(first, last)?
            end
            if (last - first + 1) > 2 then
                let t: USize = (last - first + 1) * 2 / 3
                stooge_sort(arr, first, first + t - 1)
                stooge_sort(arr, last - t + 1, last)
                stooge_sort(arr, first, first + t - 1)
            end
        end
