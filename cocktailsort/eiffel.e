class COCKTAIL_SORT

feature
    sort (arr: ARRAY [INTEGER])
        local
            swapped: BOOLEAN
            start, ending, i, tmp: INTEGER
        do
            swapped := True
            start := arr.lower
            ending := arr.upper
            from
            until not swapped
            loop
                swapped := False
                from i := start until i >= ending loop
                    if arr [i] > arr [i + 1] then
                        tmp := arr [i]
                        arr [i] := arr [i + 1]
                        arr [i + 1] := tmp
                        swapped := True
                    end
                    i := i + 1
                end
                if not swapped then
                else
                    swapped := False
                    ending := ending - 1
                    from i := ending - 1 until i < start loop
                        if arr [i] > arr [i + 1] then
                            tmp := arr [i]
                            arr [i] := arr [i + 1]
                            arr [i + 1] := tmp
                            swapped := True
                        end
                        i := i - 1
                    end
                    start := start + 1
                end
            end
        end

end
