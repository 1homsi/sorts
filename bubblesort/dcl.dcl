$ arr1 = 64
$ arr2 = 34
$ arr3 = 25
$ arr4 = 12
$ arr5 = 22
$ arr6 = 11
$ arr7 = 90
$ n = 7
$outer_loop:
$   swapped = 0
$   i = 1
$inner_loop:
$   if i .ge. n then goto end_inner
$   j = i + 1
$   xi = arr'i
$   xj = arr'j
$   if xi .le. xj then goto no_swap
$   arr'i = xj
$   arr'j = xi
$   swapped = 1
$no_swap:
$   i = i + 1
$   goto inner_loop
$end_inner:
$   n = n - 1
$   if swapped .eq. 1 then goto outer_loop
$ i = 1
$print_loop:
$   if i .gt. 7 then exit
$   write sys$output arr'i
$   i = i + 1
$   goto print_loop
