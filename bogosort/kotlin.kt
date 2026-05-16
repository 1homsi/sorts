fun bogosort(arr: MutableList<Int>) {
    while (!arr.zipWithNext().all { (a, b) -> a <= b }) {
        arr.shuffle()
    }
}
