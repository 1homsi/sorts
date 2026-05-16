import java.util.ArrayList
import java.util.Arrays

def counting_sort(arr:int[], exp:int):void
    n = arr.length
    output = int[n]
    count = int[10]
    arr.each do |x|
        count[(x / exp) % 10] += 1
    end
    (1...10).each do |i|
        count[i] += count[i-1]
    end
    i = n - 1
    while i >= 0
        idx = (arr[i] / exp) % 10
        count[idx] -= 1
        output[count[idx]] = arr[i]
        i -= 1
    end
    System.arraycopy(output, 0, arr, 0, n)
end

def radix_sort(arr:int[]):void
    return if arr.length == 0
    max = arr[0]
    arr.each {|x| max = x if x > max}
    exp = 1
    while max / exp > 0
        counting_sort(arr, exp)
        exp *= 10
    end
end

arr = int[] {170, 45, 75, 90, 802, 24, 2, 66}
radix_sort(arr)
puts Arrays.toString(arr)
