use "collections"

actor Main
    new create(env: Env) =>
        let data = [as F64: 0.78; 0.17; 0.39; 0.26; 0.72; 0.94; 0.21; 0.12; 0.23; 0.68]
        let sorted = bucket_sort(data)
        for v in sorted.values() do
            env.out.print(v.string() + " ")
        end
        env.out.print("\n")

    fun insertion_sort(bucket: Array[F64] ref): Array[F64] ref =>
        let n = bucket.size()
        var i: USize = 1
        while i < n do
            try
                let key = bucket(i)?
                var j: ISize = i.isize() - 1
                while (j >= 0) and (try bucket(j.usize())? else 0 end > key) do
                    try bucket(j.usize() + 1)? = bucket(j.usize())? end
                    j = j - 1
                end
                try bucket((j + 1).usize())? = key end
            end
            i = i + 1
        end
        bucket

    fun bucket_sort(arr: Array[F64] box): Array[F64] =>
        let n = arr.size()
        if n == 0 then return arr.clone() end
        var min_v: F64 = try arr(0)? else 0 end
        var max_v: F64 = try arr(0)? else 0 end
        for v in arr.values() do
            if v < min_v then min_v = v end
            if v > max_v then max_v = v end
        end
        let buckets = Array[Array[F64] ref](n)
        for _ in Range(0, n) do buckets.push(Array[F64]) end
        for num in arr.values() do
            var idx = ((num - min_v) / (max_v - min_v + 1) * n.f64()).usize()
            if idx >= n then idx = n - 1 end
            try buckets(idx)?.push(num) end
        end
        let result = Array[F64]
        for bucket in buckets.values() do
            let sorted_b = insertion_sort(bucket)
            for v in sorted_b.values() do result.push(v) end
        end
        result
