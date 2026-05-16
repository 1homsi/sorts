subroutine gnome_sort(arr, n)
    integer, intent(inout) :: arr(n)
    integer, intent(in) :: n
    integer :: i, temp
    i = 1
    do while (i <= n)
        if (i == 1 .or. arr(i) >= arr(i-1)) then
            i = i + 1
        else
            temp = arr(i)
            arr(i) = arr(i-1)
            arr(i-1) = temp
            i = i - 1
        end if
    end do
end subroutine gnome_sort
