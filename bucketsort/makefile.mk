SHELL := /bin/bash

DATA := 78 17 39 26 72 94 21 12 23 68
N := 10

.PHONY: all bucket_sort

all: bucket_sort

bucket_sort:
	@python3 -c "
import sys
arr = [$(subst $(eval) ,$(eval) ,$(DATA))]
n = len(arr)
mn, mx = min(arr), max(arr)
buckets = [[] for _ in range(n)]
for num in arr:
    idx = min(n-1, int((num - mn) / (mx - mn + 1) * n))
    buckets[idx].append(num)
result = []
for b in buckets:
    for i in range(1, len(b)):
        key = b[i]
        j = i - 1
        while j >= 0 and b[j] > key:
            b[j+1] = b[j]
            j -= 1
        b[j+1] = key
    result.extend(b)
print(result)
"

define NL


endef
