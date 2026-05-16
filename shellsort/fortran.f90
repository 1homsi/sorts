subroutine shellsort(arr, n)
    implicit none
    integer :: n, i, j, gap, temp
    integer :: arr(n)

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
end subroutine shellsort
