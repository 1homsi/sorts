subroutine bogosort(arr)
    integer, intent(inout) :: arr(:)
    do while (.not. is_sorted(arr))
        call shuffle(arr)
    end do
end subroutine

logical function is_sorted(arr)
    integer, intent(in) :: arr(:)
    integer :: i
    is_sorted = .true.
    do i = 1, size(arr) - 1
        if (arr(i) > arr(i+1)) then
            is_sorted = .false.
            return
        end if
    end do
end function is_sorted

subroutine shuffle(arr)
    integer, intent(inout) :: arr(:)
    integer :: i, j, tmp, n
    real :: r
    n = size(arr)
    do i = n, 2, -1
        call random_number(r)
        j = int(r * i) + 1
        tmp = arr(i)
        arr(i) = arr(j)
        arr(j) = tmp
    end do
end subroutine shuffle
