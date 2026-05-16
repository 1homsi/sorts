fn counting_sort(mut arr []int, exp int) {
	n := arr.len
	mut output := []int{len: n}
	mut count := []int{len: 10}
	for x in arr { count[(x / exp) % 10]++ }
	for i in 1..10 { count[i] += count[i - 1] }
	for i := n - 1; i >= 0; i-- {
		idx := (arr[i] / exp) % 10
		count[idx]--
		output[count[idx]] = arr[i]
	}
	for i in 0..n { arr[i] = output[i] }
}

fn radix_sort(mut arr []int) {
	if arr.len == 0 { return }
	mut max := arr[0]
	for x in arr { if x > max { max = x } }
	mut exp := 1
	for max / exp > 0 {
		counting_sort(mut arr, exp)
		exp *= 10
	}
}

fn main() {
	mut arr := [170, 45, 75, 90, 802, 24, 2, 66]
	radix_sort(mut arr)
	println(arr)
}
