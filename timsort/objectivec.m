#import <Foundation/Foundation.h>

#define MIN_RUN 32

void insertionSort(NSMutableArray *arr, NSInteger left, NSInteger right) {
    for (NSInteger i = left + 1; i <= right; i++) {
        NSNumber *key = arr[i];
        NSInteger j = i - 1;
        while (j >= left && [arr[j] compare:key] == NSOrderedDescending) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
}

void mergeRuns(NSMutableArray *arr, NSInteger left, NSInteger mid, NSInteger right) {
    NSArray *lp = [arr subarrayWithRange:NSMakeRange(left, mid - left + 1)];
    NSArray *rp = [arr subarrayWithRange:NSMakeRange(mid + 1, right - mid)];
    NSInteger i = 0, j = 0, k = left;
    while (i < (NSInteger)lp.count && j < (NSInteger)rp.count) {
        if ([lp[i] compare:rp[j]] != NSOrderedDescending) {
            arr[k++] = lp[i++];
        } else {
            arr[k++] = rp[j++];
        }
    }
    while (i < (NSInteger)lp.count) arr[k++] = lp[i++];
    while (j < (NSInteger)rp.count) arr[k++] = rp[j++];
}

void timsort(NSMutableArray *arr) {
    NSInteger n = arr.count;
    for (NSInteger i = 0; i < n; i += MIN_RUN) {
        insertionSort(arr, i, MIN(i + MIN_RUN - 1, n - 1));
    }
    for (NSInteger size = MIN_RUN; size < n; size *= 2) {
        for (NSInteger left = 0; left < n; left += 2 * size) {
            NSInteger mid = MIN(left + size - 1, n - 1);
            NSInteger right = MIN(left + 2 * size - 1, n - 1);
            if (mid < right) mergeRuns(arr, left, mid, right);
        }
    }
}

int main(int argc, char *argv[]) {
    @autoreleasepool {
        NSMutableArray *arr = [@[@5, @2, @8, @1, @9, @3, @7, @4, @6] mutableCopy];
        timsort(arr);
        NSLog(@"%@", arr);
    }
    return 0;
}
