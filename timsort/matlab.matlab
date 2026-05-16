function result = timsort(arr)
    MIN_RUN = 32;
    n = length(arr);
    i = 1;
    while i <= n
        right = min(i + MIN_RUN - 1, n);
        arr = insertion_sort(arr, i, right);
        i = i + MIN_RUN;
    end
    sz = MIN_RUN;
    while sz < n
        left = 1;
        while left <= n
            mid = min(left + sz - 1, n);
            right = min(left + 2*sz - 1, n);
            if mid < right
                arr = merge_runs(arr, left, mid, right);
            end
            left = left + 2*sz;
        end
        sz = sz * 2;
    end
    result = arr;
end

function arr = insertion_sort(arr, left, right)
    for i = left+1:right
        key = arr(i);
        j = i - 1;
        while j >= left && arr(j) > key
            arr(j+1) = arr(j);
            j = j - 1;
        end
        arr(j+1) = key;
    end
end

function arr = merge_runs(arr, left, mid, right)
    lp = arr(left:mid);
    rp = arr(mid+1:right);
    i = 1; j = 1; k = left;
    while i <= length(lp) && j <= length(rp)
        if lp(i) <= rp(j)
            arr(k) = lp(i); i = i + 1;
        else
            arr(k) = rp(j); j = j + 1;
        end
        k = k + 1;
    end
    while i <= length(lp); arr(k) = lp(i); i = i+1; k = k+1; end
    while j <= length(rp); arr(k) = rp(j); j = j+1; k = k+1; end
end

arr = [5, 2, 8, 1, 9, 3, 7, 4, 6];
disp(timsort(arr));
