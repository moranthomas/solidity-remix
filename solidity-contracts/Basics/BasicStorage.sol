pragma solidity ^0.5.1;

contract BasicStorage {

    uint256 state;  // represents persistent contract storage

    constructor (uint256 _state) public {
        state = _state;
    }

    // return a value (state) that is part of the contract’s persistent storage.
    function getValue() public view returns (uint256) {
        return state;
    }
}