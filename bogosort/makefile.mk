ARR := 3 1 4 1 5 9 2 6

define is_sorted
$(shell python3 -c "
arr = [$(1)]
print('yes' if all(arr[i] <= arr[i+1] for i in range(len(arr)-1)) else 'no')
")
endef

define bogosort
$(shell python3 -c "
import random
arr = [$(1)]
while not all(arr[i] <= arr[i+1] for i in range(len(arr)-1)):
    random.shuffle(arr)
print(' '.join(map(str, arr)))
")
endef

.PHONY: all
all:
	@echo "Input:  $(ARR)"
	@echo "Sorted: $(call bogosort,$(subst $(eval) $(eval),$(eval)$(eval),$(ARR)))"
