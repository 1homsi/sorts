program fortran
    implicit none
    integer :: arr(8) = [3, 1, 4, 1, 5, 9, 2, 6]
    call stooge_sort(arr, 1, 8)
    print *, arr

contains
    recursive subroutine stooge_sort(arr, first, last)
        integer, intent(inout) :: arr(:)
        integer, intent(in) :: first, last
        integer :: tmp, t
        if (arr(first) > arr(last)) then
            tmp = arr(first)
            arr(first) = arr(last)
            arr(last) = tmp
        end if
        if (last - first + 1 > 2) then
            t = (last - first + 1) * 2 / 3
            call stooge_sort(arr, first, first + t - 1)
            call stooge_sort(arr, last - t + 1, last)
            call stooge_sort(arr, first, first + t - 1)
        end if
    end subroutine
end program
