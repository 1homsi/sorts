use "collections"

actor Main
    new create(env: Env) =>
        let arr: Array[I64] = [5; 2; 8; 1; 9; 3; 7; 4; 6]
        timsort(arr)
        for v in arr.values() do
            env.out.write(v.string() + " ")
        end
        env.out.print("")

    fun ref insertion_sort(arr: Array[I64], left: USize, right: USize) =>
        var i = left + 1
        while i <= right do
            try
                let key = arr(i)?
                var j: ISize = i.isize() - 1
                while (j >= left.isize()) and (arr(j.usize())? > key) do
                    arr((j + 1).usize())? = arr(j.usize())?
                    j = j - 1
                end
                arr((j + 1).usize())? = key
            end
            i = i + 1
        end

    fun ref merge(arr: Array[I64], left: USize, mid: USize, right: USize) =>
        let lp: Array[I64] = arr.slice(left, mid + 1)
        let rp: Array[I64] = arr.slice(mid + 1, right + 1)
        var i: USize = 0; var j: USize = 0; var k = left
        while (i < lp.size()) and (j < rp.size()) do
            try
                if lp(i)? <= rp(j)? then
                    arr(k)? = lp(i)?; i = i + 1
                else
                    arr(k)? = rp(j)?; j = j + 1
                end
            end
            k = k + 1
        end
        while i < lp.size() do try arr(k)? = lp(i)?; i = i+1; k = k+1 end end
        while j < rp.size() do try arr(k)? = rp(j)?; j = j+1; k = k+1 end end

    fun ref timsort(arr: Array[I64]) =>
        let n = arr.size()
        let min_run: USize = 32
        var i: USize = 0
        while i < n do
            let right = (i + min_run - 1).min(n - 1)
            insertion_sort(arr, i, right)
            i = i + min_run
        end
        var size: USize = min_run
        while size < n do
            var left: USize = 0
            while left < n do
                let mid = (left + size - 1).min(n - 1)
                let right = (left + 2 * size - 1).min(n - 1)
                if mid < right then merge(arr, left, mid, right) end
                left = left + 2 * size
            end
            size = size * 2
        end
