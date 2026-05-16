fn cycle_sort(mut arr []int) int {
	mut writes := 0
	n := arr.len
	for cycle_start := 0; cycle_start < n - 1; cycle_start++ {
		mut item := arr[cycle_start]
		mut pos := cycle_start
		for i := cycle_start + 1; i < n; i++ {
			if arr[i] < item {
				pos++
			}
		}
		if pos == cycle_start {
			continue
		}
		for item == arr[pos] {
			pos++
		}
		mut tmp := arr[pos]
		arr[pos] = item
		item = tmp
		writes++
		for pos != cycle_start {
			pos = cycle_start
			for i := cycle_start + 1; i < n; i++ {
				if arr[i] < item {
					pos++
				}
			}
			for item == arr[pos] {
				pos++
			}
			tmp = arr[pos]
			arr[pos] = item
			item = tmp
			writes++
		}
	}
	return writes
}

fn main() {
	mut arr := [5, 4, 3, 2, 1]
	cycle_sort(mut arr)
	println(arr)
}
