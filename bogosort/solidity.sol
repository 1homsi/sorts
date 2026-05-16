// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bogosort {
    uint256 private nonce;

    function isSorted(uint256[] memory arr) internal pure returns (bool) {
        for (uint i = 0; i < arr.length - 1; i++) {
            if (arr[i] > arr[i + 1]) return false;
        }
        return true;
    }

    function pseudoRandom(uint256 max) internal returns (uint256) {
        nonce++;
        return uint256(keccak256(abi.encodePacked(block.timestamp, nonce))) % max;
    }

    function shuffle(uint256[] memory arr) internal returns (uint256[] memory) {
        uint n = arr.length;
        for (uint i = n - 1; i > 0; i--) {
            uint j = pseudoRandom(i + 1);
            uint tmp = arr[i];
            arr[i] = arr[j];
            arr[j] = tmp;
        }
        return arr;
    }

    function bogosort(uint256[] memory arr) public returns (uint256[] memory) {
        while (!isSorted(arr)) {
            arr = shuffle(arr);
        }
        return arr;
    }
}
