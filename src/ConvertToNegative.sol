// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

contract ConvertToNegative {
    error TooBig();

    function convertToNegative(uint256 x) external pure returns (int256) {
      // return -x
      // if -x cannot be computed, revert with "TooBig()"
      // do not hardcode any constants

      // x > 2^255 - 1
      if (x > uint256(type(int256).max) + 1) {
        revert TooBig();
      }

     // explicit corner case to avoid underflow
      if (x == uint256(type(int256).max) + 1) {
        // -2^255
        return type(int256).min;
      }

      return -int256(x);
    }
}
