#import <Foundation/Foundation.h>

void swap(NSMutableArray *arr, NSInteger i, NSInteger j) {
    id tmp = arr[i]; arr[i] = arr[j]; arr[j] = tmp;
}

NSInteger partition(NSMutableArray *arr, NSInteger low, NSInteger high) {
    NSInteger pivot = [arr[high] integerValue];
    NSInteger i = low;
    for (NSInteger j = low; j < high; j++) {
        if ([arr[j] integerValue] <= pivot) {
            swap(arr, i, j);
            i++;
        }
    }
    swap(arr, i, high);
    return i;
}

void quicksort(NSMutableArray *arr, NSInteger low, NSInteger high) {
    if (low < high) {
        NSInteger p = partition(arr, low, high);
        quicksort(arr, low, p - 1);
        quicksort(arr, p + 1, high);
    }
}

int main() {
    NSMutableArray *arr = [@[@3, @6, @8, @10, @1, @2, @1] mutableCopy];
    quicksort(arr, 0, arr.count - 1);
    NSLog(@"%@", arr);
    return 0;
}
