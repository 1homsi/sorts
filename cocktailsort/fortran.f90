subroutine cocktail_sort(arr, n)
    implicit none
    integer, intent(in) :: n
    integer, intent(inout) :: arr(n)
    logical :: swapped
    integer :: start, ending, i, tmp

    swapped = .true.
    start = 1
    ending = n
    do while (swapped)
        swapped = .false.
        do i = start, ending - 1
            if (arr(i) > arr(i + 1)) then
                tmp = arr(i)
                arr(i) = arr(i + 1)
                arr(i + 1) = tmp
                swapped = .true.
            end if
        end do
        if (.not. swapped) exit
        swapped = .false.
        ending = ending - 1
        do i = ending - 1, start, -1
            if (arr(i) > arr(i + 1)) then
                tmp = arr(i)
                arr(i) = arr(i + 1)
                arr(i + 1) = tmp
                swapped = .true.
            end if
        end do
        start = start + 1
    end do
end subroutine cocktail_sort
