primitive SelectionSort
    fun apply(arr: Array[I64] ref): Array[I64] ref =>
        let n = arr.size()
        var i: USize = 0
        while i < n do
            var min_idx = i
            var j = i + 1
            while j < n do
                try
                    if arr(j)? < arr(min_idx)? then min_idx = j end
                end
                j = j + 1
            end
            try
                let tmp = arr(i)?
                arr(i)? = arr(min_idx)?
                arr(min_idx)? = tmp
            end
            i = i + 1
        end
        arr
