fun pancake_sort(arr) {
    n = len(arr)
    for i in range(n - 1):
        for j in range(n - i - 1):
            if arr[j] > arr[j + 1]:
                arr[j], arr[j + 1] = arr[j + 1], arr[j]
}

arr = [5, 2, 8, 1, 9, 3]
pancake_sort(arr)
print("Pancake Sort: " + str(arr))
