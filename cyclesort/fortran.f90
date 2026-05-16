program fortran
    implicit none
    integer :: arr(5), n, cycle_start, item, pos, i, tmp, writes

    arr = [5, 4, 3, 2, 1]
    n = 5
    writes = 0

    do cycle_start = 1, n - 1
        item = arr(cycle_start)
        pos = cycle_start
        do i = cycle_start + 1, n
            if (arr(i) < item) pos = pos + 1
        end do
        if (pos == cycle_start) cycle
        do while (item == arr(pos))
            pos = pos + 1
        end do
        tmp = arr(pos)
        arr(pos) = item
        item = tmp
        writes = writes + 1
        do while (pos /= cycle_start)
            pos = cycle_start
            do i = cycle_start + 1, n
                if (arr(i) < item) pos = pos + 1
            end do
            do while (item == arr(pos))
                pos = pos + 1
            end do
            tmp = arr(pos)
            arr(pos) = item
            item = tmp
            writes = writes + 1
        end do
    end do

    print *, arr
end program fortran
