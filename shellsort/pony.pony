actor Main
    new create(env: Env) =>
        let arr: Array[I64] ref = [64; 34; 25; 12; 22; 11; 90]
        shell_sort(arr)
        for v in arr.values() do
            env.out.write(v.string() + " ")
        end
        env.out.write("\n")

    fun ref shell_sort(arr: Array[I64] ref) =>
        let n = arr.size()
        var gap: USize = n / 2
        while gap > 0 do
            var i: USize = gap
            while i < n do
                try
                    let temp = arr(i)?
                    var j: USize = i
                    while (j >= gap) and (try arr(j - gap)? > temp else false end) do
                        try arr(j)? = arr(j - gap)? end
                        j = j - gap
                    end
                    try arr(j)? = temp end
                end
                i = i + 1
            end
            gap = gap / 2
        end
