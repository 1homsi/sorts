procedure COMB_SORT(ARR, N)
    integer gap, i, tmp
    boolean sorted
    gap = N
    sorted = FALSE
    while not sorted do
        gap = integer(gap / 1.3)
        if gap <= 1 then
            gap = 1
            sorted = TRUE
        end
        for i = 1 to N - gap do
            if ARR(i) > ARR(i + gap) then
                tmp = ARR(i)
                ARR(i) = ARR(i + gap)
                ARR(i + gap) = tmp
                sorted = FALSE
            end
        end
    end
end
