$ ! DCL heapsort
$ arr0 = 12
$ arr1 = 11
$ arr2 = 13
$ arr3 = 5
$ arr4 = 6
$ arr5 = 7
$ n = 6
$
$ i = n/2 - 1
$ BLOOP:
$   if i .lt. 0 then goto BDONE
$   call HEAPIFY n i
$   i = i - 1
$   goto BLOOP
$ BDONE:
$
$ i = n - 1
$ SLOOP:
$   if i .le. 0 then goto SDONE
$   tmp = arr'0'
$   arr'0' = arr'i'
$   arr'i' = tmp
$   call HEAPIFY i 0
$   i = i - 1
$   goto SLOOP
$ SDONE:
$
$ write sys$output arr0, " ", arr1, " ", arr2, " ", arr3, " ", arr4, " ", arr5
$ exit
$
$ HEAPIFY: subroutine
$   pn = P1
$   pi = P2
$   largest = pi
$   left = 2*pi + 1
$   right = 2*pi + 2
$   if left .lt. pn .and. arr'left' .gt. arr'largest' then largest = left
$   if right .lt. pn .and. arr'right' .gt. arr'largest' then largest = right
$   if largest .ne. pi then
$     tmp = arr'pi'
$     arr'pi' = arr'largest'
$     arr'largest' = tmp
$     call HEAPIFY pn largest
$   endif
$ endsubroutine
