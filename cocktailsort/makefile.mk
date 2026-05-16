SHELL := /bin/bash

define cocktail_sort
	arr=($(1)); \
	n=$${#arr[@]}; \
	swapped=1; start=0; end=$$((n-1)); \
	while [ $$swapped -eq 1 ]; do \
		swapped=0; \
		for ((i=start; i<end; i++)); do \
			if [ $${arr[i]} -gt $${arr[$$((i+1))]} ]; then \
				tmp=$${arr[i]}; arr[i]=$${arr[$$((i+1))]}; arr[$$((i+1))]=$${tmp}; swapped=1; \
			fi; \
		done; \
		[ $$swapped -eq 0 ] && break; \
		swapped=0; ((end--)); \
		for ((i=end-1; i>=start; i--)); do \
			if [ $${arr[i]} -gt $${arr[$$((i+1))]} ]; then \
				tmp=$${arr[i]}; arr[i]=$${arr[$$((i+1))]}; arr[$$((i+1))]=$${tmp}; swapped=1; \
			fi; \
		done; \
		((start++)); \
	done; \
	echo "$${arr[@]}"
endef

sort:
	@$(call cocktail_sort,5 3 8 1 9 2 7 4 6 0)
