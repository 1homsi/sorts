program fortran
    implicit none
    integer, parameter :: n = 10
    real :: data(n)
    data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68]
    call bucket_sort(data, n)
    print *, data
contains
    subroutine insertion_sort(arr, m)
        real, intent(inout) :: arr(:)
        integer, intent(in) :: m
        real :: key
        integer :: i, j
        do i = 2, m
            key = arr(i)
            j = i - 1
            do while (j >= 1 .and. arr(j) > key)
                arr(j+1) = arr(j)
                j = j - 1
            end do
            arr(j+1) = key
        end do
    end subroutine

    subroutine bucket_sort(arr, n)
        real, intent(inout) :: arr(:)
        integer, intent(in) :: n
        real :: mn, mx, buckets(n, n)
        integer :: counts(n), idx, i, b, pos
        mn = minval(arr)
        mx = maxval(arr)
        counts = 0
        buckets = 0.0
        do i = 1, n
            idx = int((arr(i) - mn) / (mx - mn + 1.0) * n) + 1
            if (idx > n) idx = n
            counts(idx) = counts(idx) + 1
            buckets(idx, counts(idx)) = arr(i)
        end do
        pos = 1
        do b = 1, n
            if (counts(b) > 0) then
                call insertion_sort(buckets(b,:), counts(b))
                do i = 1, counts(b)
                    arr(pos) = buckets(b, i)
                    pos = pos + 1
                end do
            end if
        end do
    end subroutine
end program
