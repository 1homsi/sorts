PROCEDURE bucketSort(arr, maxVal)
{
    IF maxVal = 0 THEN
        RETURN arr
    END
    
    buckets is array
    FOR i = 0 TO maxVal - 1
        buckets[i] = ""
    END
    
    FOR EACH num OF arr
        IF num >= 0 AND num < maxVal THEN
            buckets[num] += num
        END
    END
    
    result is string = ""
    FOR i = 0 TO maxVal - 1
        result += buckets[i]
    END
    
    RETURN result
}

TRACE bucketSort([5, 2, 8, 1, 9, 3], 10)