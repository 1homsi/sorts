#import <Foundation/Foundation.h>

void shellSort(NSMutableArray *arr) {
    NSInteger n = arr.count;
    for (NSInteger gap = n / 2; gap > 0; gap /= 2) {
        for (NSInteger i = gap; i < n; i++) {
            NSNumber *temp = arr[i];
            NSInteger j = i;
            while (j >= gap && [arr[j - gap] compare:temp] == NSOrderedDescending) {
                arr[j] = arr[j - gap];
                j -= gap;
            }
            arr[j] = temp;
        }
    }
}

int main() {
    @autoreleasepool {
        NSMutableArray *arr = [@[@64, @34, @25, @12, @22, @11, @90] mutableCopy];
        shellSort(arr);
        NSLog(@"%@", arr);
    }
    return 0;
}
