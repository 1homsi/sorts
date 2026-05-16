SHELL := /bin/bash

.PHONY: all sort

all: sort

sort:
	@arr=(3 6 2 7 4 1 5); \
	n=$${#arr[@]}; \
	flip() { \
		local k=$$1 left=0 right=$$k tmp; \
		while [ $$left -lt $$right ]; do \
			tmp=$${arr[$$left]}; \
			arr[$$left]=$${arr[$$right]}; \
			arr[$$right]=$$tmp; \
			((left++)); ((right--)); \
		done; \
	}; \
	for ((size=n; size>1; size--)); do \
		max_idx=0; \
		for ((i=1; i<size; i++)); do \
			[ $${arr[i]} -gt $${arr[max_idx]} ] && max_idx=$$i; \
		done; \
		if [ $$max_idx -ne $$((size-1)) ]; then \
			[ $$max_idx -ne 0 ] && flip $$max_idx; \
			flip $$((size-1)); \
		fi; \
	done; \
	echo "$${arr[@]}"
