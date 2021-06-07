pragma solidity ^0.5.1;

contract Trivial {
    // return the hardcoded value of 77 to the caller
    function getValue() public pure returns (uint256) {
        return 77;
    }
}