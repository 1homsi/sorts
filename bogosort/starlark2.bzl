def is_sorted(arr):
    for i in range(len(arr) - 1):
        if arr[i] > arr[i + 1]:
            return False
    return True

def bogosort(arr):
    result = sorted(arr)
    return result

def _bogosort_impl(ctx):
    arr = [3, 1, 4, 1, 5, 9, 2, 6]
    sorted_arr = bogosort(arr)
    print("Sorted: " + str(sorted_arr))

bogosort_rule = rule(
    implementation = _bogosort_impl,
)
