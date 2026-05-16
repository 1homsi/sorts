module quicksort_mod
  implicit none
contains
  recursive subroutine quicksort(arr, low, high)
    integer, intent(inout) :: arr(:)
    integer, intent(in) :: low, high
    integer :: pivot, i, j, tmp
    if (low < high) then
      pivot = arr(high)
      i = low
      do j = low, high - 1
        if (arr(j) <= pivot) then
          tmp = arr(i); arr(i) = arr(j); arr(j) = tmp
          i = i + 1
        end if
      end do
      tmp = arr(i); arr(i) = arr(high); arr(high) = tmp
      call quicksort(arr, low, i - 1)
      call quicksort(arr, i + 1, high)
    end if
  end subroutine
end module

program main
  use quicksort_mod
  implicit none
  integer :: arr(7) = [3, 6, 8, 10, 1, 2, 1]
  call quicksort(arr, 1, 7)
  print *, arr
end program
