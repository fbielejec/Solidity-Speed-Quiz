// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract StringCompare {
  function compare(string memory a, string memory b) public pure returns (bool) {
    // compare two strings
    // return true if they are equal
    // return false if they are not equal

    bytes memory a_bytes = bytes (a);
    bytes memory b_bytes = bytes (b);

    if (a_bytes.length != b_bytes.length) {
    // some minimal gas efficiency
      return false;
    } else {
      return keccak256 (a_bytes) == keccak256 (b_bytes);
    }

  }
}
