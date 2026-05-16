class
    CYCLE_SORT

create
    make

feature
    make
        local
            arr: ARRAY [INTEGER]
            n, cycle_start, item, pos, i, tmp, writes: INTEGER
        do
            create arr.make_filled (0, 1, 5)
            arr [1] := 5; arr [2] := 4; arr [3] := 3; arr [4] := 2; arr [5] := 1
            n := 5
            writes := 0
            from cycle_start := 1 until cycle_start > n - 1 loop
                item := arr [cycle_start]
                pos := cycle_start
                from i := cycle_start + 1 until i > n loop
                    if arr [i] < item then pos := pos + 1 end
                    i := i + 1
                end
                if pos /= cycle_start then
                    from until arr [pos] /= item loop pos := pos + 1 end
                    tmp := arr [pos]; arr [pos] := item; item := tmp
                    writes := writes + 1
                    from until pos = cycle_start loop
                        pos := cycle_start
                        from i := cycle_start + 1 until i > n loop
                            if arr [i] < item then pos := pos + 1 end
                            i := i + 1
                        end
                        from until arr [pos] /= item loop pos := pos + 1 end
                        tmp := arr [pos]; arr [pos] := item; item := tmp
                        writes := writes + 1
                    end
                end
                cycle_start := cycle_start + 1
            end
            from i := 1 until i > n loop
                print (arr [i].out + " ")
                i := i + 1
            end
            print ("%N")
        end
end
