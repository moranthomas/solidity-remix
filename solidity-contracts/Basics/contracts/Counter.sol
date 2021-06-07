pragma solidity ^0.5.1;

contract Counter {

    uint256 stored_count;  // persistent contract storage

    constructor(uint256 _count) public {
        stored_count = _count;
    }
    function increment() public {
        stored_count += 1;
    }
    function getCount() public view returns (uint256) {
        return stored_count;
    }
}