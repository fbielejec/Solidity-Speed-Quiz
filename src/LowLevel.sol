// SPDX-License-Identifier: AGPL-3.0-or-later
pragma solidity 0.8.28;

interface IFoo {
    function foo() external;
}

contract LowLevel {
    function main1(address a) public returns (bool) {
      // call function "foo()" on address a
      // do not use an interface, use a low level call
      // return true if the call succeeded
      // return false if the call failed

      // bonus challenge: use an interface and a high level call to accomplish the same task
      /* (bool success, ) = a.call{value: 0 ether}(abi.encodeWithSignature("foo()")) */
      (bool success, ) = a.call(abi.encodeWithSelector(bytes4(keccak256("foo()"))));

      return success;
    }

    function main2(address a) public returns (bool) {

      // bonus challenge: use an interface
        try IFoo(a).foo() {
            return true;
        } catch {
            return false;
        }

    }

}
