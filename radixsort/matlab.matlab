function sorted = radix_sort(arr)
    if isempty(arr)
        sorted = arr;
        return;
    end
    max_val = max(arr);
    exp = 1;
    sorted = arr;
    while floor(max_val / exp) > 0
        sorted = counting_sort(sorted, exp);
        exp = exp * 10;
    end
end

function out = counting_sort(arr, exp)
    n = length(arr);
    out = zeros(1, n);
    count = zeros(1, 10);
    for i = 1:n
        idx = mod(floor(arr(i) / exp), 10) + 1;
        count(idx) = count(idx) + 1;
    end
    for i = 2:10
        count(i) = count(i) + count(i-1);
    end
    for i = n:-1:1
        idx = mod(floor(arr(i) / exp), 10) + 1;
        out(count(idx)) = arr(i);
        count(idx) = count(idx) - 1;
    end
end

arr = [170, 45, 75, 90, 802, 24, 2, 66];
disp(radix_sort(arr));
