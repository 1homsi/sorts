let swap (arr: *[]i32) (i: i64) (j: i64) : *[]i32 =
    let vi = arr[i]
    let vj = arr[j]
    in arr with [i] = vj with [j] = vi

let heapify (arr: *[]i32) (n: i64) (i: i64) : *[]i32 =
    let largest = i
    let left = 2 * i + 1
    let right = 2 * i + 2
    let largest = if left < n && arr[left] > arr[largest] then left else largest
    let largest = if right < n && arr[right] > arr[largest] then right else largest
    in if largest != i
       then let arr' = swap arr i largest
            in heapify arr' n largest
       else arr

let heapsort (arr: *[]i32) : []i32 =
    let n = length arr
    let arr = loop arr for i in (n/2-1)..(n/2-2)..0 do heapify arr n i
    let arr = loop arr for i in (n-1)..(n-2)..1 do
        let arr' = swap arr 0 i
        in heapify arr' i 0
    in arr

let main : []i32 = heapsort [12i32, 11i32, 13i32, 5i32, 6i32, 7i32]
