NUMS := 5 3 8 1 9 2 7 4 6 0

define gnome_sort
$(shell python3 -c "
arr = [$(subst $(space),$(comma),$(1))]
i = 0
while i < len(arr):
    if i == 0 or arr[i] >= arr[i-1]:
        i += 1
    else:
        arr[i],arr[i-1] = arr[i-1],arr[i]
        i -= 1
print(' '.join(map(str,arr)))
")
endef

all:
	@echo "Sorted: $(call gnome_sort,$(NUMS))"
