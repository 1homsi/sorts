subroutine comb_sort(arr, n)
    implicit none
    integer, intent(in) :: n
    integer, intent(inout) :: arr(n)
    integer :: gap, i, tmp
    logical :: sorted
    real :: shrink
    shrink = 1.3
    gap = n
    sorted = .false.
    do while (.not. sorted)
        gap = int(real(gap) / shrink)
        if (gap <= 1) then
            gap = 1
            sorted = .true.
        end if
        do i = 1, n - gap
            if (arr(i) > arr(i + gap)) then
                tmp = arr(i)
                arr(i) = arr(i + gap)
                arr(i + gap) = tmp
                sorted = .false.
            end if
        end do
    end do
end subroutine comb_sort
