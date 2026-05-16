C: SHELL SORT IN PILOT
T: Enter the array size
A: {size}
T: Sorting...
C: Initialize gap
gap = 1
C: Calculate initial gap
*GAP
  gap = gap * 3 + 1
  *GAPCOMP
    gap > size : *GAPLOOP
    $: *GAP
*GAPLOOP
  gap > 0 : *GAPEND
  gap = gap / 3
  $: *GAPLOOP
*GAPEND
T: Sorted array
