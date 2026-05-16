subroutine selection_sort(arr, n)
    implicit none
    integer, intent(in) :: n
    integer, intent(inout) :: arr(n)
    integer :: i, j, min_idx, tmp
    do i = 1, n - 1
        min_idx = i
        do j = i + 1, n
            if (arr(j) < arr(min_idx)) min_idx = j
        end do
        tmp = arr(i)
        arr(i) = arr(min_idx)
        arr(min_idx) = tmp
    end do
end subroutine selection_sort
