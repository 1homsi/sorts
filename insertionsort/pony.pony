fun insertion_sort(arr: Array[I64] ref): Array[I64] ref =>
    let n = arr.size()
    var i: USize = 1
    while i < n do
        try
            let key = arr(i)?
            var j: ISize = i.isize() - 1
            while j >= 0 do
                try
                    if arr(j.usize())? <= key then break end
                    arr((j + 1).usize())? = arr(j.usize())?
                end
                j = j - 1
            end
            arr((j + 1).usize())? = key
        end
        i = i + 1
    end
    arr
