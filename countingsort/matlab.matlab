function output = counting_sort(arr)
    if isempty(arr)
        output = arr;
        return;
    end
    mn = min(arr);
    mx = max(arr);
    rng = mx - mn + 1;
    count = zeros(1, rng);
    for i = 1:length(arr)
        count(arr(i) - mn + 1) = count(arr(i) - mn + 1) + 1;
    end
    for i = 2:rng
        count(i) = count(i) + count(i - 1);
    end
    output = zeros(1, length(arr));
    for i = length(arr):-1:1
        idx = arr(i) - mn + 1;
        output(count(idx)) = arr(i);
        count(idx) = count(idx) - 1;
    end
end

arr = [4, 2, 2, 8, 3, 3, 1];
disp(counting_sort(arr));
