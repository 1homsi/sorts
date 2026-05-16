program mergesort_prog
  implicit none
  integer :: arr(7) = [38, 27, 43, 3, 9, 82, 10]
  call merge_sort(arr, 1, 7)
  print *, arr
contains
  recursive subroutine merge_sort(a, lo, hi)
    integer, intent(inout) :: a(:)
    integer, intent(in) :: lo, hi
    integer :: mid
    if (lo >= hi) return
    mid = (lo + hi) / 2
    call merge_sort(a, lo, mid)
    call merge_sort(a, mid+1, hi)
    call merge(a, lo, mid, hi)
  end subroutine

  subroutine merge(a, lo, mid, hi)
    integer, intent(inout) :: a(:)
    integer, intent(in) :: lo, mid, hi
    integer :: tmp(hi-lo+1), i, j, k
    i = lo; j = mid+1; k = 1
    do while (i <= mid .and. j <= hi)
      if (a(i) <= a(j)) then
        tmp(k) = a(i); i = i + 1
      else
        tmp(k) = a(j); j = j + 1
      end if
      k = k + 1
    end do
    do while (i <= mid)
      tmp(k) = a(i); i = i + 1; k = k + 1
    end do
    do while (j <= hi)
      tmp(k) = a(j); j = j + 1; k = k + 1
    end do
    a(lo:hi) = tmp(1:hi-lo+1)
  end subroutine
end program
