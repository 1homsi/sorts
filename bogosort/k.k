isSorted:{&/x[1+!-1+#x]>=x[!-1+#x]}
shuffle:{x@(-1+#x)?!#x}
bogosort:{while[~isSorted[x];x:shuffle[x]];x}
bogosort[3 1 4 1 5 9 2 6]
