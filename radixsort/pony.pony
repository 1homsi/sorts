use "collections"

primitive RadixSort
    fun counting_sort(arr: Array[U64] ref, exp: U64) =>
        let n = arr.size()
        let output = Array[U64].init(0, n)
        let count = Array[U64].init(0, 10)
        for x in arr.values() do
            let idx = (x / exp) % 10
            try count(idx)? = count(idx)? + 1 end
        end
        for i in Range[USize](1, 10) do
            try count(i)? = count(i)? + count(i-1)? end
        end
        var i: ISize = n.isize() - 1
        while i >= 0 do
            try
                let x = arr(i.usize())?
                let idx = ((x / exp) % 10).usize()
                count(idx)? = count(idx)? - 1
                output(count(idx)?)? = x
            end
            i = i - 1
        end
        for j in Range[USize](0, n) do
            try arr(j)? = output(j)? end
        end

    fun sort(arr: Array[U64] ref) =>
        if arr.size() == 0 then return end
        var max: U64 = try arr(0)? else 0 end
        for x in arr.values() do if x > max then max = x end end
        var exp: U64 = 1
        while max / exp > 0 do
            counting_sort(arr, exp)
            exp = exp * 10
        end

actor Main
    new create(env: Env) =>
        let arr = Array[U64].from([170; 45; 75; 90; 802; 24; 2; 66])
        RadixSort.sort(arr)
        for x in arr.values() do
            env.out.write(x.string() + " ")
        end
        env.out.print("")
