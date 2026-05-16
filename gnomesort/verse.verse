gnome_sort<public>(arr:[]int, n:int):[]int =
    i:int = 0
    loop:
        if i >= n then break
        if i = 0 or arr[i] >= arr[i-1] then
            i = i + 1
        else:
            tmp:int = arr[i]
            arr[i] = arr[i-1]
            arr[i-1] = tmp
            i = i - 1
    arr
