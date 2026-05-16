#import <Foundation/Foundation.h>

void cocktailSort(NSMutableArray *arr) {
    BOOL swapped = YES;
    NSInteger start = 0;
    NSInteger end = arr.count - 1;
    while (swapped) {
        swapped = NO;
        for (NSInteger i = start; i < end; i++) {
            if ([arr[i] intValue] > [arr[i + 1] intValue]) {
                [arr exchangeObjectAtIndex:i withObjectAtIndex:i + 1];
                swapped = YES;
            }
        }
        if (!swapped) break;
        swapped = NO;
        end--;
        for (NSInteger i = end - 1; i >= start; i--) {
            if ([arr[i] intValue] > [arr[i + 1] intValue]) {
                [arr exchangeObjectAtIndex:i withObjectAtIndex:i + 1];
                swapped = YES;
            }
        }
        start++;
    }
}
