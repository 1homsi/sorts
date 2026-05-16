function result = bogosort(arr)
    while ~is_sorted(arr)
        arr = arr(randperm(length(arr)));
    end
    result = arr;
end

function s = is_sorted(arr)
    s = all(arr(1:end-1) <= arr(2:end));
end

arr = [3, 1, 4, 1, 5, 9, 2, 6];
disp(bogosort(arr));
