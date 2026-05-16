#import <Foundation/Foundation.h>

void countingSort(NSMutableArray *arr, int exp) {
    int n = (int)arr.count;
    NSMutableArray *output = [NSMutableArray arrayWithCapacity:n];
    for (int i = 0; i < n; i++) [output addObject:@0];
    int count[10] = {0};
    for (int i = 0; i < n; i++) count[([arr[i] intValue] / exp) % 10]++;
    for (int i = 1; i < 10; i++) count[i] += count[i-1];
    for (int i = n-1; i >= 0; i--) {
        int idx = ([arr[i] intValue] / exp) % 10;
        output[--count[idx]] = arr[i];
    }
    for (int i = 0; i < n; i++) arr[i] = output[i];
}

void radixSort(NSMutableArray *arr) {
    if (!arr.count) return;
    int max = [arr[0] intValue];
    for (NSNumber *n in arr) if ([n intValue] > max) max = [n intValue];
    for (int exp = 1; max / exp > 0; exp *= 10) countingSort(arr, exp);
}

int main() {
    NSMutableArray *arr = [@[@170, @45, @75, @90, @802, @24, @2, @66] mutableCopy];
    radixSort(arr);
    NSLog(@"%@", arr);
    return 0;
}
