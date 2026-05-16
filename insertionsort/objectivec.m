#import <Foundation/Foundation.h>

void insertionSort(NSMutableArray *arr) {
    NSInteger n = arr.count;
    for (NSInteger i = 1; i < n; i++) {
        NSNumber *key = arr[i];
        NSInteger j = i - 1;
        while (j >= 0 && [arr[j] compare:key] == NSOrderedDescending) {
            arr[j + 1] = arr[j];
            j--;
        }
        arr[j + 1] = key;
    }
}
