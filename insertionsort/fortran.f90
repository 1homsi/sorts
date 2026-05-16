subroutine insertion_sort(arr, n)
  integer, intent(inout) :: arr(n)
  integer, intent(in)    :: n
  integer :: i, j, key
  do i = 2, n
    key = arr(i)
    j = i - 1
    do while (j >= 1 .and. arr(j) > key)
      arr(j+1) = arr(j)
      j = j - 1
    end do
    arr(j+1) = key
  end do
end subroutine insertion_sort
