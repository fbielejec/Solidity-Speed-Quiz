// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

import {Test, console} from "forge-std/Test.sol";

contract Account2 {
    address immutable owner;

    constructor(address _owner) payable {
        owner = _owner;
    }

    function withdraw() external {
        require(msg.sender == owner, "Not owner");
        (bool ok, ) = owner.call{value: address(this).balance}("");
        require(ok);
    }
}

contract AccountMaker {
  function makeAccount(address owner) external payable returns (address) {
    // use create2 to create an account with the owner address
    // the salt should be the owner address
    // the value sent to them should be msg.value

    // get bytecode
    bytes memory bytecode = abi.encodePacked(
                                             type(Account2).creationCode, // bytecode
                                             abi.encode(owner) // constructor arguments
                                             );

    // from test predictAdress
    bytes32 salt = bytes32(bytes20(uint160(owner)));

    address addr;

    /*
      create2(v, p, n, s)
      create new contract with code at memory p to p + n
      and send v wei
      and return the new address
      where new address = first 20 bytes of keccak256(0xff + address(this) + s + keccak256(mem[p…(p+n)))
      s = big-endian 256-bit value
    */
    assembly {
    addr :=
      create2(
              callvalue(), // wei sent with current call
              // Actual code starts after skipping the first 32 bytes
              add(bytecode, 0x20),
              mload(bytecode), // Load the size of code contained in the first 32 bytes
              salt
              )

        /* if iszero(extcodesize(addr)) { revert(0, 0) } */
    }

    return addr;
  }
}
