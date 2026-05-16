#![cfg_attr(not(feature = "std"), no_std, no_main)]

#[ink::contract]
mod insertion_sort {
    use ink::prelude::vec::Vec;

    #[ink(storage)]
    pub struct InsertionSort {}

    impl InsertionSort {
        #[ink(constructor)]
        pub fn new() -> Self {
            Self {}
        }

        #[ink(message)]
        pub fn sort(&self, mut arr: Vec<i32>) -> Vec<i32> {
            let n = arr.len();
            for i in 1..n {
                let key = arr[i];
                let mut j = i as i32 - 1;
                while j >= 0 && arr[j as usize] > key {
                    arr[(j + 1) as usize] = arr[j as usize];
                    j -= 1;
                }
                arr[(j + 1) as usize] = key;
            }
            arr
        }
    }
}
