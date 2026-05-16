NUMS := 5 3 1 4 2

define insertion_sort
$(shell python3 -c "
arr = [$(subst $(space),$(comma),$(1))]
for i in range(1, len(arr)):
    key = arr[i]; j = i - 1
    while j >= 0 and arr[j] > key:
        arr[j+1] = arr[j]; j -= 1
    arr[j+1] = key
print(' '.join(map(str, arr)))
")
endef

sorted:
	@echo $(call insertion_sort,$(NUMS))
