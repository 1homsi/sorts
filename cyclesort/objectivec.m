#import <Foundation/Foundation.h>

void cycleSort(NSMutableArray *arr) {
    NSInteger n = arr.count;
    for (NSInteger cycleStart = 0; cycleStart < n - 1; cycleStart++) {
        NSNumber *item = arr[cycleStart];
        NSInteger pos = cycleStart;
        for (NSInteger i = cycleStart + 1; i < n; i++) {
            if ([arr[i] integerValue] < [item integerValue]) pos++;
        }
        if (pos == cycleStart) continue;
        while ([item integerValue] == [arr[pos] integerValue]) pos++;
        NSNumber *tmp = arr[pos];
        arr[pos] = item;
        item = tmp;
        while (pos != cycleStart) {
            pos = cycleStart;
            for (NSInteger i = cycleStart + 1; i < n; i++) {
                if ([arr[i] integerValue] < [item integerValue]) pos++;
            }
            while ([item integerValue] == [arr[pos] integerValue]) pos++;
            tmp = arr[pos];
            arr[pos] = item;
            item = tmp;
        }
    }
}

int main(int argc, const char *argv[]) {
    @autoreleasepool {
        NSMutableArray *arr = [@[@5, @4, @3, @2, @1] mutableCopy];
        cycleSort(arr);
        NSLog(@"%@", arr);
    }
    return 0;
}
