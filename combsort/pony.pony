primitive CombSort
    fun sort(arr: Array[I64] ref): Array[I64] ref =>
        let n = arr.size()
        var gap: USize = n
        var sorted = false
        while not sorted do
            gap = (gap.f64() / 1.3).usize()
            if gap <= 1 then
                gap = 1
                sorted = true
            end
            var i: USize = 0
            while (i + gap) < n do
                try
                    if arr(i)? > arr(i + gap)? then
                        let tmp = arr(i)?
                        arr(i)? = arr(i + gap)?
                        arr(i + gap)? = tmp
                        sorted = false
                    end
                end
                i = i + 1
            end
        end
        arr
