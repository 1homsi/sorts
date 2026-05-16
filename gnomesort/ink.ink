#![cfg_attr(not(feature = "std"), no_std, no_main)]

#[ink::contract]
mod gnome_sort {
    use ink::prelude::vec::Vec;

    #[ink(storage)]
    pub struct GnomeSort {
        data: Vec<i32>,
    }

    impl GnomeSort {
        #[ink(constructor)]
        pub fn new(data: Vec<i32>) -> Self {
            Self { data }
        }

        #[ink(message)]
        pub fn sort(&mut self) {
            let n = self.data.len();
            let mut i = 0usize;
            while i < n {
                if i == 0 || self.data[i] >= self.data[i - 1] {
                    i += 1;
                } else {
                    self.data.swap(i, i - 1);
                    i -= 1;
                }
            }
        }

        #[ink(message)]
        pub fn get(&self) -> Vec<i32> {
            self.data.clone()
        }
    }
}
