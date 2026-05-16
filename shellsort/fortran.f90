program shell_sort_prog
    implicit none
    integer :: arr(7), n, gap, i, j, temp
    arr = [64, 34, 25, 12, 22, 11, 90]
    n = 7
    gap = n / 2
    do while (gap > 0)
        do i = gap + 1, n
            temp = arr(i)
            j = i
            do while (j > gap .and. arr(j - gap) > temp)
                arr(j) = arr(j - gap)
                j = j - gap
            end do
            arr(j) = temp
        end do
        gap = gap / 2
    end do
    print *, arr
end program shell_sort_prog
