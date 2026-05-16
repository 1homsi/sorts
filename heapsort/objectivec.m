#import <Foundation/Foundation.h>

void heapify(NSMutableArray *arr, NSInteger n, NSInteger i) {
    NSInteger largest = i, left = 2*i+1, right = 2*i+2;
    if (left < n && [arr[left] intValue] > [arr[largest] intValue]) largest = left;
    if (right < n && [arr[right] intValue] > [arr[largest] intValue]) largest = right;
    if (largest != i) {
        [arr exchangeObjectAtIndex:i withObjectAtIndex:largest];
        heapify(arr, n, largest);
    }
}

void heapsort(NSMutableArray *arr) {
    NSInteger n = arr.count;
    for (NSInteger i = n/2-1; i >= 0; i--) heapify(arr, n, i);
    for (NSInteger i = n-1; i > 0; i--) {
        [arr exchangeObjectAtIndex:0 withObjectAtIndex:i];
        heapify(arr, i, 0);
    }
}

int main() {
    NSMutableArray *arr = [@[@12, @11, @13, @5, @6, @7] mutableCopy];
    heapsort(arr);
    NSLog(@"%@", arr);
    return 0;
}
