import rand

fn is_sorted(arr []int) bool {
    for i in 0 .. arr.len - 1 {
        if arr[i] > arr[i + 1] {
            return false
        }
    }
    return true
}

fn shuffle(arr []int) []int {
    mut a := arr.clone()
    n := a.len
    for i := n - 1; i > 0; i-- {
        j := rand.intn(i + 1) or { 0 }
        a[i], a[j] = a[j], a[i]
    }
    return a
}

fn bogosort(arr []int) []int {
    mut a := arr.clone()
    for !is_sorted(a) {
        a = shuffle(a)
    }
    return a
}

fn main() {
    arr := [3, 1, 4, 1, 5, 9, 2, 6]
    println(bogosort(arr))
}
