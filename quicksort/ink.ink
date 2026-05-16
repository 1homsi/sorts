#![cfg_attr(not(feature = "std"), no_std, no_main)]

#[ink::contract]
mod quicksort {
    use ink::prelude::vec::Vec;

    #[ink(storage)]
    pub struct Quicksort {}

    impl Quicksort {
        #[ink(constructor)]
        pub fn new() -> Self { Self {} }

        fn partition(arr: &mut Vec<i32>, low: usize, high: usize) -> usize {
            let pivot = arr[high];
            let mut i = low;
            for j in low..high {
                if arr[j] <= pivot {
                    arr.swap(i, j);
                    i += 1;
                }
            }
            arr.swap(i, high);
            i
        }

        fn quicksort_impl(arr: &mut Vec<i32>, low: usize, high: usize) {
            if low < high {
                let p = Self::partition(arr, low, high);
                if p > 0 { Self::quicksort_impl(arr, low, p - 1); }
                Self::quicksort_impl(arr, p + 1, high);
            }
        }

        #[ink(message)]
        pub fn sort(&self, mut arr: Vec<i32>) -> Vec<i32> {
            let n = arr.len();
            if n > 1 { Self::quicksort_impl(&mut arr, 0, n - 1); }
            arr
        }
    }
}
