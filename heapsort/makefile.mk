SHELL := /bin/bash

ARR := 12 11 13 5 6 7

define heapify
$(shell python3 -c "
arr = list(map(int, '$(1)'.split()))
n, i = $(2), $(3)
def h(a, sz, idx):
    l, r, lg = 2*idx+1, 2*idx+2, idx
    if l < sz and a[l] > a[lg]: lg = l
    if r < sz and a[r] > a[lg]: lg = r
    if lg != idx: a[idx], a[lg] = a[lg], a[idx]; h(a, sz, lg)
h(arr, n, i)
print(' '.join(map(str, arr)))
")
endef

.PHONY: heapsort
heapsort:
	@python3 -c "
arr = [12, 11, 13, 5, 6, 7]
def heapify(a, n, i):
    lg = i; l = 2*i+1; r = 2*i+2
    if l < n and a[l] > a[lg]: lg = l
    if r < n and a[r] > a[lg]: lg = r
    if lg != i: a[i], a[lg] = a[lg], a[i]; heapify(a, n, lg)
n = len(arr)
for i in range(n//2-1, -1, -1): heapify(arr, n, i)
for i in range(n-1, 0, -1):
    arr[0], arr[i] = arr[i], arr[0]; heapify(arr, i, 0)
print(arr)"
