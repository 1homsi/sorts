#import <Foundation/Foundation.h>

void bubbleSort(NSMutableArray *arr) {
    NSInteger n = arr.count;
    BOOL swapped;
    do {
        swapped = NO;
        for (NSInteger i = 0; i < n - 1; i++) {
            if ([arr[i] intValue] > [arr[i+1] intValue]) {
                [arr exchangeObjectAtIndex:i withObjectAtIndex:i+1];
                swapped = YES;
            }
        }
        n--;
    } while (swapped);
}

int main() {
    NSMutableArray *arr = [@[@64, @34, @25, @12, @22, @11, @90] mutableCopy];
    bubbleSort(arr);
    NSLog(@"%@", arr);
    return 0;
}
