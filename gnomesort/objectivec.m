#import <Foundation/Foundation.h>

void gnomeSort(NSMutableArray *arr) {
    NSInteger i = 0;
    NSInteger n = arr.count;
    while (i < n) {
        if (i == 0 || [arr[i] compare:arr[i-1]] != NSOrderedAscending) {
            i++;
        } else {
            [arr exchangeObjectAtIndex:i withObjectAtIndex:i-1];
            i--;
        }
    }
}
