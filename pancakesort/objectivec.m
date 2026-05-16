#import <Foundation/Foundation.h>

void flip(NSMutableArray *arr, NSInteger k) {
    NSInteger left = 0, right = k;
    while (left < right) {
        [arr exchangeObjectAtIndex:left withObjectAtIndex:right];
        left++; right--;
    }
}

void pancakeSort(NSMutableArray *arr) {
    NSInteger n = arr.count;
    for (NSInteger size = n; size > 1; size--) {
        NSInteger maxIdx = 0;
        for (NSInteger i = 1; i < size; i++) {
            if ([arr[i] integerValue] > [arr[maxIdx] integerValue]) maxIdx = i;
        }
        if (maxIdx != size - 1) {
            if (maxIdx != 0) flip(arr, maxIdx);
            flip(arr, size - 1);
        }
    }
}

int main() {
    NSMutableArray *arr = [@[@3, @6, @2, @7, @4, @1, @5] mutableCopy];
    pancakeSort(arr);
    NSLog(@"%@", arr);
    return 0;
}
