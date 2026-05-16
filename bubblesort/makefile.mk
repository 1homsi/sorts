NUMBERS := 64 34 25 12 22 11 90

.PHONY: sort
sort:
	@python3 -c "\
arr = [$(subst $(space),$(comma),$(NUMBERS))]; \
n = len(arr); swapped = True; \
_=[(arr.__setitem__(i, arr[i+1]) or arr.__setitem__(i+1, t)) \
   for _ in range(n) for i in range(n-1) \
   if arr[i] > arr[i+1] \
   for t in [arr[i]]]; \
print(arr)"

space := $(subst ,, )
comma := ,
