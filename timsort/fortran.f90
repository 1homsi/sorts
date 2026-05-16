program timsort_prog
    implicit none
    integer, parameter :: MIN_RUN = 32
    integer :: arr(9) = [5, 2, 8, 1, 9, 3, 7, 4, 6]
    call timsort(arr, size(arr))
    print *, arr

contains

    subroutine insertion_sort(arr, left, right)
        integer, intent(inout) :: arr(:)
        integer, intent(in) :: left, right
        integer :: i, j, key
        do i = left + 1, right
            key = arr(i)
            j = i - 1
            do while (j >= left .and. arr(j) > key)
                arr(j + 1) = arr(j)
                j = j - 1
            end do
            arr(j + 1) = key
        end do
    end subroutine

    subroutine merge(arr, left, mid, right)
        integer, intent(inout) :: arr(:)
        integer, intent(in) :: left, mid, right
        integer :: ln, rn, i, j, k
        integer, allocatable :: lp(:), rp(:)
        ln = mid - left + 1
        rn = right - mid
        allocate(lp(ln), rp(rn))
        lp = arr(left:mid)
        rp = arr(mid+1:right)
        i = 1; j = 1; k = left
        do while (i <= ln .and. j <= rn)
            if (lp(i) <= rp(j)) then
                arr(k) = lp(i); i = i + 1
            else
                arr(k) = rp(j); j = j + 1
            end if
            k = k + 1
        end do
        do while (i <= ln); arr(k) = lp(i); i = i + 1; k = k + 1; end do
        do while (j <= rn); arr(k) = rp(j); j = j + 1; k = k + 1; end do
        deallocate(lp, rp)
    end subroutine

    subroutine timsort(arr, n)
        integer, intent(inout) :: arr(:)
        integer, intent(in) :: n
        integer :: i, size, left, mid, right
        i = 1
        do while (i <= n)
            call insertion_sort(arr, i, min(i + MIN_RUN - 1, n))
            i = i + MIN_RUN
        end do
        size = MIN_RUN
        do while (size < n)
            left = 1
            do while (left <= n)
                mid = min(left + size - 1, n)
                right = min(left + 2 * size - 1, n)
                if (mid < right) call merge(arr, left, mid, right)
                left = left + 2 * size
            end do
            size = size * 2
        end do
    end subroutine

end program timsort_prog
