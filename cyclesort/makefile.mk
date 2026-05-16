SHELL := /bin/bash

.PHONY: all sort

ARR := 5 4 3 2 1

all: sort

sort:
	@arr=($(ARR)); \
	n=$${#arr[@]}; \
	for ((cs=0; cs<n-1; cs++)); do \
		item=$${arr[$$cs]}; \
		pos=$$cs; \
		for ((i=cs+1; i<n; i++)); do \
			[[ $${arr[$$i]} -lt $$item ]] && ((pos++)); \
		done; \
		[[ $$pos -eq $$cs ]] && continue; \
		while [[ $${arr[$$pos]} -eq $$item ]]; do ((pos++)); done; \
		tmp=$${arr[$$pos]}; arr[$$pos]=$$item; item=$$tmp; \
		while [[ $$pos -ne $$cs ]]; do \
			pos=$$cs; \
			for ((i=cs+1; i<n; i++)); do \
				[[ $${arr[$$i]} -lt $$item ]] && ((pos++)); \
			done; \
			while [[ $${arr[$$pos]} -eq $$item ]]; do ((pos++)); done; \
			tmp=$${arr[$$pos]}; arr[$$pos]=$$item; item=$$tmp; \
		done; \
	done; \
	echo "$${arr[@]}"
