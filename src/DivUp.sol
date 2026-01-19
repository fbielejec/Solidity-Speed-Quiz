// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract DivUp {

    // ceiling division
  function divUp(uint256 x, uint256 y) public pure returns (uint256) {
    // return x / y rounded up.
    // if y divides x exactly, return x / y
    // if there is a fractional part in the quotient, add 1 to the answer
    // if y == 0 revert
    if (y == 0) {
      revert ("divisor is 0");
    }

    if (x == 0) {
      return 0;
    }

    return (x - 1) / y + 1;
    }
}
