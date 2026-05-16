program pancake_sort_prog
    implicit none
    integer :: arr(7) = [3, 6, 2, 7, 4, 1, 5]
    integer :: n, size, i, max_idx, tmp

    n = 7
    do size = n, 2, -1
        max_idx = 1
        do i = 2, size
            if (arr(i) > arr(max_idx)) max_idx = i
        end do
        if (max_idx /= size) then
            if (max_idx /= 1) call flip(arr, max_idx)
            call flip(arr, size)
        end if
    end do
    print *, arr

contains
    subroutine flip(arr, k)
        integer, intent(inout) :: arr(:)
        integer, intent(in) :: k
        integer :: left, right, tmp
        left = 1; right = k
        do while (left < right)
            tmp = arr(left)
            arr(left) = arr(right)
            arr(right) = tmp
            left = left + 1
            right = right - 1
        end do
    end subroutine flip
end program pancake_sort_prog
