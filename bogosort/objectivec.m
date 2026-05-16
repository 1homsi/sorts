#import <Foundation/Foundation.h>

BOOL isSorted(NSArray *arr) {
    for (NSUInteger i = 0; i < arr.count - 1; i++) {
        if ([arr[i] intValue] > [arr[i+1] intValue]) return NO;
    }
    return YES;
}

NSArray *shuffle(NSArray *arr) {
    NSMutableArray *a = [arr mutableCopy];
    for (NSInteger i = a.count - 1; i > 0; i--) {
        NSInteger j = arc4random_uniform((uint32_t)(i + 1));
        [a exchangeObjectAtIndex:i withObjectAtIndex:j];
    }
    return [a copy];
}

NSArray *bogosort(NSArray *arr) {
    while (!isSorted(arr)) {
        arr = shuffle(arr);
    }
    return arr;
}

int main() {
    @autoreleasepool {
        NSArray *arr = @[@3, @1, @4, @1, @5, @9, @2, @6];
        NSLog(@"%@", bogosort(arr));
    }
    return 0;
}
