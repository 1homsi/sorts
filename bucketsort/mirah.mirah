import java.util.ArrayList

def insertion_sort(bucket:ArrayList) : void
    n = bucket.size
    i = 1
    while i < n
        key = double(bucket.get(i))
        j = i - 1
        while j >= 0 and double(bucket.get(j)) > key
            bucket.set(j + 1, bucket.get(j))
            j -= 1
        end
        bucket.set(j + 1, double(key))
        i += 1
    end
end

def bucket_sort(arr:ArrayList) : ArrayList
    n = arr.size
    return arr if n == 0
    min_v = double(arr.get(0))
    max_v = double(arr.get(0))
    i = 0
    while i < n
        v = double(arr.get(i))
        min_v = v if v < min_v
        max_v = v if v > max_v
        i += 1
    end
    buckets = ArrayList.new(n)
    n.times { buckets.add(ArrayList.new) }
    i = 0
    while i < n
        num = double(arr.get(i))
        idx = int((num - min_v) / (max_v - min_v + 1) * n)
        idx = n - 1 if idx >= n
        ArrayList(buckets.get(idx)).add(double(num))
        i += 1
    end
    result = ArrayList.new
    buckets.each do |b:ArrayList|
        insertion_sort(b)
        b.each { |v| result.add(v) }
    end
    result
end

data = ArrayList.new
[0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68].each { |v| data.add(double(v)) }
System.out.println(bucket_sort(data))
