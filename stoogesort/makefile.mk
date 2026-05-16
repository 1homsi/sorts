SHELL := /bin/bash

define STOOGE_SORT
$(eval ARR := $(1))
$(eval FIRST := $(2))
$(eval LAST := $(3))
endef

all:
	@arr=(3 1 4 1 5 9 2 6); \
	stooge_sort() { \
	    local first=$$1 last=$$2; \
	    if [ $${arr[$$first]} -gt $${arr[$$last]} ]; then \
	        local tmp=$${arr[$$first]}; \
	        arr[$$first]=$${arr[$$last]}; \
	        arr[$$last]=$$tmp; \
	    fi; \
	    local n=$$((last - first + 1)); \
	    if [ $$n -gt 2 ]; then \
	        local t=$$((n * 2 / 3)); \
	        stooge_sort $$first $$((first + t - 1)); \
	        stooge_sort $$((last - t + 1)) $$last; \
	        stooge_sort $$first $$((first + t - 1)); \
	    fi; \
	}; \
	stooge_sort 0 $$((${#arr[@]} - 1)); \
	echo "$${arr[@]}"
