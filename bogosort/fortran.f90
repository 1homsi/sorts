program bogosort
    implicit none
    integer :: arr(8) = [3, 1, 4, 1, 5, 9, 2, 6]
    integer :: n, i, j, tmp
    real :: r
    logical :: sorted

    n = size(arr)
    call random_seed()

    do while (.not. is_sorted(arr, n))
        do i = n, 2, -1
            call random_number(r)
            j = int(r * i) + 1
            tmp = arr(i)
            arr(i) = arr(j)
            arr(j) = tmp
        end do
    end do

    print *, arr

contains

    function is_sorted(a, n) result(res)
        integer, intent(in) :: a(:), n
        logical :: res
        integer :: k
        res = .true.
        do k = 1, n - 1
            if (a(k) > a(k + 1)) then
                res = .false.
                return
            end if
        end do
    end function is_sorted

end program bogosort
