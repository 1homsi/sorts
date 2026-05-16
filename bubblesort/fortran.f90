program fortran
    implicit none
    integer :: arr(7) = [64, 34, 25, 12, 22, 11, 90]
    integer :: n, i, tmp
    logical :: swapped

    n = size(arr)
    do
        swapped = .false.
        do i = 1, n - 1
            if (arr(i) > arr(i + 1)) then
                tmp = arr(i)
                arr(i) = arr(i + 1)
                arr(i + 1) = tmp
                swapped = .true.
            end if
        end do
        n = n - 1
        if (.not. swapped) exit
    end do

    print *, arr
end program fortran
