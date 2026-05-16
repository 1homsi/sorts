#import <Foundation/Foundation.h>

NSMutableArray *combSort(NSMutableArray *arr) {
    NSInteger n = arr.count;
    NSInteger gap = n;
    double shrink = 1.3;
    BOOL sorted = NO;
    while (!sorted) {
        gap = (NSInteger)(gap / shrink);
        if (gap <= 1) {
            gap = 1;
            sorted = YES;
        }
        for (NSInteger i = 0; i + gap < n; i++) {
            if ([arr[i] integerValue] > [arr[i + gap] integerValue]) {
                [arr exchangeObjectAtIndex:i withObjectAtIndex:i + gap];
                sorted = NO;
            }
        }
    }
    return arr;
}
