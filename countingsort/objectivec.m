#import <Foundation/Foundation.h>

NSArray* countingSort(NSArray *arr) {
    if (arr.count == 0) return arr;
    NSInteger min = [arr[0] integerValue], max = [arr[0] integerValue];
    for (NSNumber *n in arr) {
        if (n.integerValue < min) min = n.integerValue;
        if (n.integerValue > max) max = n.integerValue;
    }
    NSInteger range = max - min + 1;
    NSMutableArray *count = [NSMutableArray arrayWithCapacity:range];
    for (NSInteger i = 0; i < range; i++) [count addObject:@0];
    for (NSNumber *n in arr) count[n.integerValue - min] = @([count[n.integerValue - min] integerValue] + 1);
    for (NSInteger i = 1; i < range; i++) count[i] = @([count[i] integerValue] + [count[i-1] integerValue]);
    NSMutableArray *output = [NSMutableArray arrayWithCapacity:arr.count];
    for (NSUInteger i = 0; i < arr.count; i++) [output addObject:@0];
    for (NSInteger i = arr.count - 1; i >= 0; i--) {
        NSInteger v = [arr[i] integerValue];
        NSInteger pos = [count[v - min] integerValue] - 1;
        count[v - min] = @(pos);
        output[pos] = @(v);
    }
    return [output copy];
}

int main() {
    @autoreleasepool {
        NSArray *arr = @[@4, @2, @2, @8, @3, @3, @1];
        NSLog(@"%@", countingSort(arr));
    }
    return 0;
}
