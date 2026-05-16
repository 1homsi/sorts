pragma solidity ^0.8.0;

contract GnomeSort {
    function sort(int256[] memory arr) public pure returns (int256[] memory) {
        uint i = 0;
        uint n = arr.length;
        while (i < n) {
            if (i == 0 || arr[i] >= arr[i - 1]) {
                i++;
            } else {
                int256 tmp = arr[i];
                arr[i] = arr[i - 1];
                arr[i - 1] = tmp;
                i--;
            }
        }
        return arr;
    }
}
