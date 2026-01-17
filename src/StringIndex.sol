// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract StringIndex {
    function main(string memory str, uint256 index) public pure returns (string memory) {
        // return the character at index in str
        // assume str only consists of ascii characters
      bytes memory b = bytes (str);
      bytes1 one_byte = b [index];
      bytes memory packed = abi.encodePacked (one_byte);

      return string (packed);
    }
}
