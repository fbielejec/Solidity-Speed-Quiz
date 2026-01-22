// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract IsNBitSet {
    function main(bytes32 x, uint256 n) public returns (bool) {
        // return true if the nth bit is set
        // 000....0001 with n = 0 returns true
        // 000....0001 with n = 1 returns false
        // 000....0010 with n = 1 returns true

    bytes32 mask = 0x0000000000000000000000000000000000000000000000000000000000000000;
    /* return ((x & mask) [n] == 0x01); */

    /* mask [n] = 1; */

    }
}
