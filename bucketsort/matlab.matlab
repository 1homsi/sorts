function result = bucket_sort(arr)
    n = length(arr);
    if n == 0
        result = arr;
        return;
    end
    min_v = min(arr);
    max_v = max(arr);
    buckets = cell(1, n);
    for i = 1:n
        buckets{i} = [];
    end
    for i = 1:n
        idx = floor((arr(i) - min_v) / (max_v - min_v + 1) * n) + 1;
        if idx > n
            idx = n;
        end
        buckets{idx}(end+1) = arr(i);
    end
    result = [];
    for i = 1:n
        buckets{i} = insertion_sort(buckets{i});
        result = [result, buckets{i}];
    end
end

function bucket = insertion_sort(bucket)
    n = length(bucket);
    for i = 2:n
        key = bucket(i);
        j = i - 1;
        while j >= 1 && bucket(j) > key
            bucket(j+1) = bucket(j);
            j = j - 1;
        end
        bucket(j+1) = key;
    end
end

data = [0.78, 0.17, 0.39, 0.26, 0.72, 0.94, 0.21, 0.12, 0.23, 0.68];
disp(bucket_sort(data));
