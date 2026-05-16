program heapsort_prog
  implicit none
  integer :: arr(6), n, i, tmp

  arr = [12, 11, 13, 5, 6, 7]
  n = 6

  do i = n/2, 1, -1
    call heapify(arr, n, i)
  end do

  do i = n, 2, -1
    tmp = arr(1); arr(1) = arr(i); arr(i) = tmp
    call heapify(arr, i-1, 1)
  end do

  print *, arr

contains

  recursive subroutine heapify(arr, n, i)
    integer, intent(inout) :: arr(:)
    integer, intent(in) :: n, i
    integer :: largest, left, right, tmp
    largest = i; left = 2*i; right = 2*i+1
    if (left <= n .and. arr(left) > arr(largest)) largest = left
    if (right <= n .and. arr(right) > arr(largest)) largest = right
    if (largest /= i) then
      tmp = arr(i); arr(i) = arr(largest); arr(largest) = tmp
      call heapify(arr, n, largest)
    end if
  end subroutine heapify

end program heapsort_prog
