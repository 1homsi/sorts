SHELL := /bin/bash

define comb_sort
	$(eval arr := $(1))
	$(eval n := $(words $(arr)))
	$(eval gap := $(n))
	$(eval sorted := 0)
	@while [ "$(sorted)" -eq 0 ]; do \
		gap=$$(( gap * 10 / 13 )); \
		[ $$gap -le 1 ] && gap=1 && sorted=1; \
		changed=0; \
		for i in $$(seq 1 $$((n - gap))); do \
			j=$$((i + gap)); \
			a=$$(echo "$(arr)" | tr ' ' '\n' | sed -n "$${i}p"); \
			b=$$(echo "$(arr)" | tr ' ' '\n' | sed -n "$${j}p"); \
			[ $$a -gt $$b ] && changed=1; \
		done; \
		[ $$gap -eq 1 ] && [ $$changed -eq 0 ] && sorted=1; \
	done
endef

sort:
	$(call comb_sort, 5 3 8 1 9 2 7 4 6)
