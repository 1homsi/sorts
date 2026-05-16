#import <Foundation/Foundation.h>

void insertionSort(NSMutableArray *bucket) {
    NSInteger n = bucket.count;
    for (NSInteger i = 1; i < n; i++) {
        double key = [bucket[i] doubleValue];
        NSInteger j = i - 1;
        while (j >= 0 && [bucket[j] doubleValue] > key) {
            bucket[j + 1] = bucket[j];
            j--;
        }
        bucket[j + 1] = @(key);
    }
}

NSArray *bucketSort(NSArray *arr) {
    NSInteger n = arr.count;
    if (n == 0) return arr;
    double minV = [arr[0] doubleValue], maxV = [arr[0] doubleValue];
    for (NSNumber *v in arr) {
        if ([v doubleValue] < minV) minV = [v doubleValue];
        if ([v doubleValue] > maxV) maxV = [v doubleValue];
    }
    NSMutableArray *buckets = [NSMutableArray arrayWithCapacity:n];
    for (NSInteger i = 0; i < n; i++) [buckets addObject:[NSMutableArray array]];
    for (NSNumber *num in arr) {
        NSInteger idx = (NSInteger)(([num doubleValue] - minV) / (maxV - minV + 1) * n);
        if (idx >= n) idx = n - 1;
        [buckets[idx] addObject:num];
    }
    NSMutableArray *result = [NSMutableArray array];
    for (NSMutableArray *bucket in buckets) {
        insertionSort(bucket);
        [result addObjectsFromArray:bucket];
    }
    return result;
}

int main() {
    @autoreleasepool {
        NSArray *data = @[@0.78, @0.17, @0.39, @0.26, @0.72, @0.94, @0.21, @0.12, @0.23, @0.68];
        NSLog(@"%@", bucketSort(data));
    }
    return 0;
}
