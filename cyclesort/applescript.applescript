on cycleSort(arr)
	set n to count of arr
	set writes to 0
	repeat with cycleStart from 1 to n - 1
		set item to item cycleStart of arr
		set pos to cycleStart
		repeat with i from cycleStart + 1 to n
			if (item i of arr) < item then set pos to pos + 1
		end repeat
		if pos is not cycleStart then
			repeat while (item pos of arr) is equal to item
				set pos to pos + 1
			end repeat
			set tmp to item pos of arr
			set item pos of arr to item
			set item to tmp
			set writes to writes + 1
			repeat while pos is not cycleStart
				set pos to cycleStart
				repeat with i from cycleStart + 1 to n
					if (item i of arr) < item then set pos to pos + 1
				end repeat
				repeat while (item pos of arr) is equal to item
					set pos to pos + 1
				end repeat
				set tmp to item pos of arr
				set item pos of arr to item
				set item to tmp
				set writes to writes + 1
			end repeat
		end if
	end repeat
	return arr
end cycleSort

set myArr to {5, 4, 3, 2, 1}
set myArr to cycleSort(myArr)
return myArr
