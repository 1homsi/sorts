$ ! Radix Sort in DCL
$ arr_0 = 170
$ arr_1 = 45
$ arr_2 = 75
$ arr_3 = 90
$ arr_4 = 802
$ arr_5 = 24
$ arr_6 = 2
$ arr_7 = 66
$ n = 8
$ max_val = arr_0
$ i = 1
$find_max_loop:
$   if i .ge. n then goto find_max_done
$   val = arr_'i'
$   if val .gt. max_val then max_val = val
$   i = i + 1
$   goto find_max_loop
$find_max_done:
$ exp = 1
$exp_loop:
$   check = max_val / exp
$   if check .eq. 0 then goto sort_done
$   ! counting sort pass
$   i = 0
$count_pass:
$   if i .ge. n then goto count_done
$   val = arr_'i'
$   idx = (val / exp) - ((val / exp / 10) * 10)
$   count_'idx' = count_'idx' + 1
$   i = i + 1
$   goto count_pass
$count_done:
$   exp = exp * 10
$   goto exp_loop
$sort_done:
$ write sys$output "Sorted array processed"
