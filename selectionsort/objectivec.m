#import <Foundation/Foundation.h>

void selectionSort(NSMutableArray *arr) {
    NSUInteger n = arr.count;
    for (NSUInteger i = 0; i < n; i++) {
        NSUInteger minIdx = i;
        for (NSUInteger j = i + 1; j < n; j++) {
            if ([arr[j] intValue] < [arr[minIdx] intValue]) minIdx = j;
        }
        [arr exchangeObjectAtIndex:i withObjectAtIndex:minIdx];
    }
}
