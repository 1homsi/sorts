program counting_sort_prog
    implicit none
    integer :: arr(7) = [4, 2, 2, 8, 3, 3, 1]
    integer :: n, i, mn, mx, rng
    integer, allocatable :: count(:), output(:)

    n = size(arr)
    mn = minval(arr)
    mx = maxval(arr)
    rng = mx - mn + 1
    allocate(count(rng), output(n))
    count = 0
    do i = 1, n
        count(arr(i) - mn + 1) = count(arr(i) - mn + 1) + 1
    end do
    do i = 2, rng
        count(i) = count(i) + count(i - 1)
    end do
    do i = n, 1, -1
        count(arr(i) - mn + 1) = count(arr(i) - mn + 1) - 1
        output(count(arr(i) - mn + 1) + 1) = arr(i)
    end do
    print *, output
    deallocate(count, output)
end program counting_sort_prog
