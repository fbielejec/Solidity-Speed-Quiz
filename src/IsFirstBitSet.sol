// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract IsFirstBitSet {
  function main(bytes32 x) public returns (bool) {
    // return true if the first bit is set
    // for example 0x000....0001 returns true
    // for example 0x000....0010 returns false

    bytes32 mask = 0x0000000000000000000000000000000000000000000000000000000000000001;
    bytes32 res = x & mask;
    bytes1 last_byte = res [31];
    /* bytes memory ret = abi.encodePacked(last_byte); */

    /* bool ret; */
    /* assembly { */
    /*   ret := mload(add(res, 20)) */
    /*   /\* ret := mload(last_byte) *\/ */
    /* } */

    return (last_byte == 0x01);
  }
}
