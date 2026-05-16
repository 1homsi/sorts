use "collections"

primitive MergeSort
    fun merge(left: Array[I64] val, right: Array[I64] val): Array[I64] val =>
        let result = Array[I64]
        var i: USize = 0; var j: USize = 0
        while (i < left.size()) and (j < right.size()) do
            try
                if left(i)? <= right(j)? then
                    result.push(left(i)?); i = i + 1
                else
                    result.push(right(j)?); j = j + 1
                end
            end
        end
        while i < left.size() do
            try result.push(left(i)?) end; i = i + 1
        end
        while j < right.size() do
            try result.push(right(j)?) end; j = j + 1
        end
        result

    fun sort(arr: Array[I64] val): Array[I64] val =>
        if arr.size() <= 1 then return arr end
        let mid = arr.size() / 2
        let left = sort(arr.trim(0, mid))
        let right = sort(arr.trim(mid))
        merge(left, right)

actor Main
    new create(env: Env) =>
        let arr: Array[I64] val = [38; 27; 43; 3; 9; 82; 10]
        let sorted = MergeSort.sort(arr)
        for v in sorted.values() do
            env.out.print(v.string() + " ")
        end
        env.out.print("\n")
