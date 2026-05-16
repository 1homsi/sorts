fun bitonicsort(arr: Array[Int], lo: Int, cnt: Int, dir: Int) do
    if cnt > 1 then
        var k = cnt / 2
        bitonicsort(arr, lo, k, 1)
        bitonicsort(arr, lo + k, k, 0)
        bitonicmerge(arr, lo, cnt, dir)
    end
end

fun bitonicmerge(arr: Array[Int], lo: Int, cnt: Int, dir: Int) do
    if cnt > 1 then
        var k = cnt / 2
        for i in [lo..lo + cnt - k[ do
            if (arr[i] > arr[i + k]) == (dir == 1) then
                var tmp = arr[i]
                arr[i] = arr[i + k]
                arr[i + k] = tmp
            end
        end
        bitonicmerge(arr, lo, k, dir)
        bitonicmerge(arr, lo + k, k, dir)
    end
end

var arr = [5, 2, 8, 1, 9, 3, 7, 4]
bitonicsort(arr, 0, arr.length, 1)
print(arr)
