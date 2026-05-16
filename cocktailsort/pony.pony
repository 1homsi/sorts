actor Main
    new create(env: Env) =>
        let arr = [5; 3; 8; 1; 9; 2; 7; 4; 6; 0]
        cocktail_sort(arr)

    fun ref cocktail_sort(arr: Array[I64] ref) =>
        var swapped = true
        var start: USize = 0
        var end': USize = arr.size() - 1
        while swapped do
            swapped = false
            var i: USize = start
            while i < end' do
                try
                    let a = arr(i)?
                    let b = arr(i + 1)?
                    if a > b then
                        arr(i)? = b
                        arr(i + 1)? = a
                        swapped = true
                    end
                end
                i = i + 1
            end
            if not swapped then break end
            swapped = false
            if end' > 0 then end' = end' - 1 end
            if end' > 0 then
                var j: USize = end' - 1
                while j >= start do
                    try
                        let a = arr(j)?
                        let b = arr(j + 1)?
                        if a > b then
                            arr(j)? = b
                            arr(j + 1)? = a
                            swapped = true
                        end
                    end
                    if j == 0 then break end
                    j = j - 1
                end
            end
            start = start + 1
        end
