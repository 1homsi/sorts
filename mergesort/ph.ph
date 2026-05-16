fun merge(left: [int], right: [int]) : [int] =
    if null(left) then right
    else if null(right) then left
    else if hd(left) <= hd(right)
    then hd(left) :: merge(tl(left), right)
    else hd(right) :: merge(left, tl(right))

fun mergeSort(arr: [int]) : [int] =
    let n = length(arr)
    in
        if n <= 1 then arr
        else
            let mid = n div 2
                left = mergeSort(List.take(arr, mid))
                right = mergeSort(List.drop(arr, mid))
            in merge(left, right)
        end
    end

val result = mergeSort([38, 27, 43, 3, 9, 82, 10])
