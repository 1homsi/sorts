#import <Foundation/Foundation.h>

void compareAndSwap(NSMutableArray *arr, NSInteger i, NSInteger j, BOOL direction) {
    NSComparisonResult cmp = [arr[i] compare:arr[j]];
    BOOL greater = cmp == NSOrderedDescending;
    if (direction == greater) {
        [arr exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
}

void bitonicMerge(NSMutableArray *arr, NSInteger lo, NSInteger cnt, BOOL direction) {
    if (cnt > 1) {
        NSInteger k = cnt / 2;
        for (NSInteger i = lo; i < lo + k; i++) {
            compareAndSwap(arr, i, i + k, direction);
        }
        bitonicMerge(arr, lo, k, direction);
        bitonicMerge(arr, lo + k, k, direction);
    }
}

void bitonicSort(NSMutableArray *arr, NSInteger lo, NSInteger cnt, BOOL direction) {
    if (cnt > 1) {
        NSInteger k = cnt / 2;
        bitonicSort(arr, lo, k, YES);
        bitonicSort(arr, lo + k, k, NO);
        bitonicMerge(arr, lo, cnt, direction);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *data = [@[@3, @7, @4, @8, @6, @2, @1, @5] mutableCopy];
        bitonicSort(data, 0, data.count, YES);
        NSLog(@"%@", data);
    }
    return 0;
}
