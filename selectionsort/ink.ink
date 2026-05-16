#![cfg_attr(not(feature = "std"), no_std)]

#[ink::contract]
mod selection_sort {
    use ink::prelude::vec::Vec;

    #[ink(storage)]
    pub struct SelectionSort {}

    impl SelectionSort {
        #[ink(constructor)]
        pub fn new() -> Self { Self {} }

        #[ink(message)]
        pub fn sort(&self, mut arr: Vec<i32>) -> Vec<i32> {
            let n = arr.len();
            for i in 0..n {
                let mut min_idx = i;
                for j in (i + 1)..n {
                    if arr[j] < arr[min_idx] { min_idx = j; }
                }
                arr.swap(i, min_idx);
            }
            arr
        }
    }
}
