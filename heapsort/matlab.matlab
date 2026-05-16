function arr = heapsort(arr)
    n = length(arr);
    for i = floor(n/2):-1:1
        arr = heapify(arr, n, i);
    end
    for i = n:-1:2
        tmp = arr(1); arr(1) = arr(i); arr(i) = tmp;
        arr = heapify(arr, i-1, 1);
    end
end

function arr = heapify(arr, n, i)
    largest = i;
    left = 2*i;
    right = 2*i+1;
    if left <= n && arr(left) > arr(largest)
        largest = left;
    end
    if right <= n && arr(right) > arr(largest)
        largest = right;
    end
    if largest ~= i
        tmp = arr(i); arr(i) = arr(largest); arr(largest) = tmp;
        arr = heapify(arr, n, largest);
    end
end

arr = [12, 11, 13, 5, 6, 7];
result = heapsort(arr);
disp(result)
