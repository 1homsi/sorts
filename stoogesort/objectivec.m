#import <Foundation/Foundation.h>

void stoogeSort(NSMutableArray *arr, NSInteger first, NSInteger last) {
    if ([arr[first] intValue] > [arr[last] intValue]) {
        [arr exchangeObjectAtIndex:first withObjectAtIndex:last];
    }
    if (last - first + 1 > 2) {
        NSInteger t = (last - first + 1) * 2 / 3;
        stoogeSort(arr, first, first + t - 1);
        stoogeSort(arr, last - t + 1, last);
        stoogeSort(arr, first, first + t - 1);
    }
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *arr = [@[@3, @1, @4, @1, @5, @9, @2, @6] mutableCopy];
        stoogeSort(arr, 0, arr.count - 1);
        NSLog(@"%@", arr);
    }
    return 0;
}
