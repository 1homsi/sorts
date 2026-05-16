SHELL := /bin/bash

ARR := 170 45 75 90 802 24 2 66

.PHONY: all sort

all: sort

sort:
	@arr=($(ARR)); \
	n=$${#arr[@]}; \
	max=$${arr[0]}; \
	for x in "$${arr[@]}"; do [ $$x -gt $$max ] && max=$$x; done; \
	exp=1; \
	while [ $$((max / exp)) -gt 0 ]; do \
		count=(); \
		for i in $$(seq 0 9); do count[$$i]=0; done; \
		for x in "$${arr[@]}"; do \
			idx=$$(( (x / exp) % 10 )); \
			count[$$idx]=$$(( count[$$idx] + 1 )); \
		done; \
		for i in $$(seq 1 9); do \
			count[$$i]=$$(( count[$$i] + count[$$((i-1))] )); \
		done; \
		out=(); for i in $$(seq 0 $$((n-1))); do out[$$i]=0; done; \
		for i in $$(seq $$((n-1)) -1 0); do \
			x=$${arr[$$i]}; \
			idx=$$(( (x / exp) % 10 )); \
			count[$$idx]=$$(( count[$$idx] - 1 )); \
			out[$${count[$$idx]}]=$$x; \
		done; \
		arr=("$${out[@]}"); \
		exp=$$((exp * 10)); \
	done; \
	echo "$${arr[@]}"
