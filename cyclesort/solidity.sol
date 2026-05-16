// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CycleSort {
    function cycleSort(uint256[] memory arr) public pure returns (uint256[] memory) {
        uint256 n = arr.length;
        for (uint256 cycleStart = 0; cycleStart < n - 1; cycleStart++) {
            uint256 item = arr[cycleStart];
            uint256 pos = cycleStart;
            for (uint256 i = cycleStart + 1; i < n; i++) {
                if (arr[i] < item) pos++;
            }
            if (pos == cycleStart) continue;
            while (item == arr[pos]) pos++;
            uint256 tmp = arr[pos];
            arr[pos] = item;
            item = tmp;
            while (pos != cycleStart) {
                pos = cycleStart;
                for (uint256 i = cycleStart + 1; i < n; i++) {
                    if (arr[i] < item) pos++;
                }
                while (item == arr[pos]) pos++;
                tmp = arr[pos];
                arr[pos] = item;
                item = tmp;
            }
        }
        return arr;
    }
}
