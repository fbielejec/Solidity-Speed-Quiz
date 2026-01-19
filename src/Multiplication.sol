// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;
import {console} from "forge-std/console.sol";

contract Multiplication {
    function multiply(uint8 rewards, uint8 numDays) public pure returns (uint256 totalRewards) {
        // TODO: Implement the logic to calculate the total rewards, which is
        // the number of rewards multiplied by the number of days.

      /* console.log ("@rewards: %s %s ", rewards, uint256 (rewards)); */
      return uint256 (rewards) * uint256 (numDays);
    }
}
