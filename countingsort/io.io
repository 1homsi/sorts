CountingSort := Object clone do(
    sort := method(arr,
        n := arr size
        if (n == 0, return arr)
        mn := arr reduce(min: message)
        mx := arr reduce(max: message)
        range := mx - mn + 1
        count := List clone
        range repeat(count append(0))
        arr foreach(v,
            idx := v - mn
            count atPut(idx, (count at(idx)) + 1)
        )
        for(i, 1, range - 1,
            count atPut(i, (count at(i)) + (count at(i - 1)))
        )
        output := List clone
        n repeat(output append(0))
        for(i, n - 1, 0, -1,
            v := arr at(i)
            idx := v - mn
            pos := (count at(idx)) - 1
            count atPut(idx, pos)
            output atPut(pos, v)
        )
        output
    )
)

result := CountingSort sort(list(4, 2, 2, 8, 3, 3, 1))
result foreach(v, v print; " " print)
"
" print
