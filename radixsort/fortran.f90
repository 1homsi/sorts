program radix_sort_prog
  implicit none
  integer :: arr(8) = [170, 45, 75, 90, 802, 24, 2, 66]
  call radix_sort(arr, 8)
  print *, arr

contains

  subroutine counting_sort(arr, n, exp)
    integer, intent(inout) :: arr(n)
    integer, intent(in) :: n, exp
    integer :: output(n), count(0:9), i, idx
    count = 0
    do i = 1, n
      idx = mod(arr(i) / exp, 10)
      count(idx) = count(idx) + 1
    end do
    do i = 1, 9
      count(i) = count(i) + count(i-1)
    end do
    do i = n, 1, -1
      idx = mod(arr(i) / exp, 10)
      output(count(idx)) = arr(i)
      count(idx) = count(idx) - 1
    end do
    arr = output
  end subroutine

  subroutine radix_sort(arr, n)
    integer, intent(inout) :: arr(n)
    integer, intent(in) :: n
    integer :: max_val, exp, i
    max_val = arr(1)
    do i = 2, n
      if (arr(i) > max_val) max_val = arr(i)
    end do
    exp = 1
    do while (max_val / exp > 0)
      call counting_sort(arr, n, exp)
      exp = exp * 10
    end do
  end subroutine

end program
