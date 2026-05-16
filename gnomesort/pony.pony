class GnomeSort
    fun ref sort(arr: Array[I64] ref): Array[I64] ref =>
        var i: USize = 0
        let n = arr.size()
        while i < n do
            if (i == 0) or (try arr(i)? >= arr(i - 1)? else false end) then
                i = i + 1
            else
                try
                    let tmp = arr(i)?
                    arr(i)? = arr(i - 1)?
                    arr(i - 1)? = tmp
                end
                if i > 0 then i = i - 1 end
            end
        end
        arr
