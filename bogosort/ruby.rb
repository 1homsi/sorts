def bogosort(arr)
    while !arr.each_cons(2).all? { |a, b| a <= b }
        arr.shuffle!
    end
    arr
end
