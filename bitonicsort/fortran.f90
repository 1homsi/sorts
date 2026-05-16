program bitonic
    implicit none
    integer :: data(8) = [3, 7, 4, 8, 6, 2, 1, 5]
    integer :: n

    n = size(data)
    call bitonic_sort(data, 1, n, .true.)
    print *, data

contains

    subroutine compare_and_swap(arr, i, j, direction)
        integer, intent(inout) :: arr(:)
        integer, intent(in) :: i, j
        logical, intent(in) :: direction
        integer :: tmp
        if (direction .eqv. (arr(i) > arr(j))) then
            tmp = arr(i); arr(i) = arr(j); arr(j) = tmp
        end if
    end subroutine

    recursive subroutine bitonic_merge(arr, lo, cnt, direction)
        integer, intent(inout) :: arr(:)
        integer, intent(in) :: lo, cnt
        logical, intent(in) :: direction
        integer :: k, i
        if (cnt > 1) then
            k = cnt / 2
            do i = lo, lo + k - 1
                call compare_and_swap(arr, i, i + k, direction)
            end do
            call bitonic_merge(arr, lo, k, direction)
            call bitonic_merge(arr, lo + k, k, direction)
        end if
    end subroutine

    recursive subroutine bitonic_sort(arr, lo, cnt, direction)
        integer, intent(inout) :: arr(:)
        integer, intent(in) :: lo, cnt
        logical, intent(in) :: direction
        integer :: k
        if (cnt > 1) then
            k = cnt / 2
            call bitonic_sort(arr, lo, k, .true.)
            call bitonic_sort(arr, lo + k, k, .false.)
            call bitonic_merge(arr, lo, cnt, direction)
        end if
    end subroutine

end program bitonic
