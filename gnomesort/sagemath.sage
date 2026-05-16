def gnome_sort(lst):
    arr = list(lst)
    n = len(arr)
    i = 0
    while i < n:
        if i == 0 or arr[i] >= arr[i-1]:
            i += 1
        else:
            arr[i], arr[i-1] = arr[i-1], arr[i]
            i -= 1
    return arr

data = [5, 3, 8, 1, 9, 2, 7, 4, 6, 0]
print(gnome_sort(data))
